// Mastertool hesap servisi istemcisi (sözleşme docs/mastertool-api.md v1).
// Master Tool mobil: /api/mt/auth/login {client:"android"|"ios"} → yalnız ortak (sso) oturum. Her modül kendi önekiyle
// (sm, fm, sq, np, cv, ip) /api/<app>/auth/sso ile şifresiz modül oturumu alır; lisans kapalıysa 403 app_disabled.
// Adres listesi: ilk ulaşılamazsa sıradaki denenir. Hata biçimi sunucuyla aynı: {"code","message","detail"} → MtError.
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

const kDefaultBaseUrls = ['https://mastertool.download'];

class MtError implements Exception {
  MtError(this.status, this.code, this.message, {this.detail, this.body = const {}});
  final int status;
  final String code;
  final String message;
  final Object? detail;
  /// Sunucu gövdesinin tamamı (409 çakışmada {version, blob} buradan okunur)
  final Map<String, dynamic> body;
  bool get sessionExpired => status == 401 && code != 'bad_credentials';
  bool get network => status == 0;
  @override
  String toString() => '$code: $message';
}

class MtApi {
  MtApi({List<String> baseUrls = kDefaultBaseUrls, this.userAgent = 'MasterTool-Mobile'}) : _bases = List.unmodifiable(baseUrls);
  final List<String> _bases;
  final String userAgent;
  final http.Client _client = http.Client();
  int _active = 0;

  String get baseUrl => _bases[_active];

  Future<Map<String, dynamic>> request(String method, String path,
      {Object? body, String? bearer, Duration timeout = const Duration(seconds: 20)}) async {
    MtError? last;
    for (var i = 0; i < _bases.length; i++) {
      final idx = (_active + i) % _bases.length;
      final uri = Uri.parse('${_bases[idx]}$path');
      try {
        final req = http.Request(method, uri);
        req.headers['Accept'] = 'application/json';
        req.headers['User-Agent'] = userAgent;
        if (bearer != null) req.headers['Authorization'] = 'Bearer $bearer';
        if (body != null) {
          req.headers['Content-Type'] = 'application/json';
          req.body = jsonEncode(body);
        }
        final res = await http.Response.fromStream(await _client.send(req).timeout(timeout));
        _active = idx;
        return _decode(res);
      } on MtError {
        rethrow; // sunucu yanıt verdi: sıradaki adrese geçilmez
      } on TimeoutException {
        last = MtError(0, 'network', 'Sunucuya ulaşılamadı (${uri.host})');
      } on http.ClientException catch (e) {
        last = MtError(0, 'network', e.message);
      }
    }
    throw last ?? MtError(0, 'network', 'Sunucuya ulaşılamadı');
  }

  Map<String, dynamic> _decode(http.Response res) {
    Map<String, dynamic> j = const {};
    if (res.body.isNotEmpty) {
      try {
        final d = jsonDecode(res.body);
        if (d is Map<String, dynamic>) j = d;
      } catch (_) {/* JSON değil */}
    }
    if (res.statusCode >= 200 && res.statusCode < 300) return j;
    throw MtError(res.statusCode, (j['code'] ?? 'http_${res.statusCode}').toString(),
        (j['message'] ?? 'İstek başarısız (${res.statusCode})').toString(), detail: j['detail'], body: j);
  }

  // ---- Master Tool (ortak oturum)
  Future<Map<String, dynamic>> prelogin(String email) => request('POST', '/api/mt/auth/prelogin', body: {'email': email});
  Future<Map<String, dynamic>> login({required String email, required String authHash, required String client,
          required String device, required String appVersion}) =>
      request('POST', '/api/mt/auth/login',
          body: {'email': email, 'auth_hash': authHash, 'client': client, 'device': device, 'app_version': appVersion});
  Future<Map<String, dynamic>> logout(String ssoToken) => request('POST', '/api/mt/auth/logout', bearer: ssoToken);
  Future<Map<String, dynamic>> apps(String ssoToken) => request('GET', '/api/mt/apps', bearer: ssoToken);
  Future<Map<String, dynamic>> me(String ssoToken) => request('GET', '/api/mt/me', bearer: ssoToken);

  // ---- modül oturumu ve şifreli kitaplık senkronu (/api/<app>/…)
  Future<Map<String, dynamic>> moduleSso(String app, String ssoToken, String device, String appVersion) =>
      request('POST', '/api/$app/auth/sso', body: {'sso_token': ssoToken, 'device': device, 'app_version': appVersion});
  Future<Map<String, dynamic>> moduleSettings(String app, String token, {bool? syncEnabled}) =>
      request('PUT', '/api/$app/settings', bearer: token, body: {'sync_enabled': syncEnabled});
  Future<Map<String, dynamic>> libraryGet(String app, String token) => request('GET', '/api/$app/library', bearer: token);
  Future<Map<String, dynamic>> libraryPut(String app, String token, {required int? baseVersion, required String blob}) =>
      request('PUT', '/api/$app/library', bearer: token, body: {'base_version': baseVersion, 'blob': blob});
  Future<Map<String, dynamic>> libraryDelete(String app, String token) => request('DELETE', '/api/$app/library', bearer: token);

  void close() => _client.close();
}
