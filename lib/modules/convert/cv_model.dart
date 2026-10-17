// Convert Master veri modeli — senkron `data` şeması masaüstüyle birebir (convertmaster/src/account.js PROJECT_FIELDS):
// kind project {createdAt, name, type video|image|audio, sourceExts, targetExt, sourceMode file|folder, includeSubfolders,
//               concurrency, speech{enabled, model, language, perWindow}, ocr{enabled, languages}, options{video, image, audio},
//               folderId, color, notes}; kind folder {name, parentId};
// kind settings (id "settings") {appTheme, language, defaultConcurrency, speechModel, speechConcurrency, ocrLanguages}.
// Yerel (senkronlanmaz, localOnly): sourcePath, unchecked, sources (mobilde seçilen dosya kopyaları), outputs (iş durumları).
import 'dart:ui';

import '../ssh/ssh_model.dart' show parseHex;
import 'cv_formats.dart';

const kCvLocalOnly = {'sourcePath', 'unchecked', 'sources', 'outputs'};

class CvProject {
  CvProject(this.id, this.raw);
  final String id;
  final Map<String, dynamic> raw;

  String get name => (raw['name'] ?? '').toString();
  String get type => (raw['type'] ?? 'video').toString();
  CvType get typeInfo => kCvTypes[type] ?? kCvTypes['video']!;
  List<String> get sourceExts => ((raw['sourceExts'] as List?) ?? const []).map((x) => x.toString()).toList();
  String get targetExt => (raw['targetExt'] ?? typeInfo.defaultTarget).toString();
  String get sourceMode => (raw['sourceMode'] ?? 'folder').toString();
  bool get includeSubfolders => raw['includeSubfolders'] != false;
  int get concurrency => (raw['concurrency'] as num?)?.toInt() ?? 2;
  Map<String, dynamic> get speech => (raw['speech'] as Map?)?.cast<String, dynamic>() ?? defaultSpeech();
  Map<String, dynamic> get ocr => (raw['ocr'] as Map?)?.cast<String, dynamic>() ?? defaultOcr();
  bool get speechEnabled => (type == 'video' || type == 'audio') && speech['enabled'] == true;
  String get speechModel => (speech['model'] ?? 'base').toString();
  String get speechLanguage => (speech['language'] ?? 'auto').toString();
  bool get ocrEnabled => type == 'image' && ocr['enabled'] == true;
  List<String> get ocrLanguages => ((ocr['languages'] as List?) ?? const ['tur', 'eng']).map((x) => x.toString()).toList();
  /// Bu projenin dosyaları için metin işi var mı (resim → OCR, video/ses → konuşma).
  bool get textEnabled => type == 'image' ? ocrEnabled : speechEnabled;
  int get textDoneCount => outputs.values.where((x) => x is Map && x['text'] is Map && (x['text'] as Map)['status'] == 'done').length;
  Map<String, dynamic> get options => cleanOptions((raw['options'] as Map?)?.cast<String, dynamic>());
  String? get folderId => raw['folderId'] as String?;
  String get color => (raw['color'] ?? typeInfo.color).toString();
  Color get colorValue => parseHex(color);
  String get notes => (raw['notes'] ?? '').toString();
  int get createdAt => (raw['createdAt'] as num?)?.toInt() ?? 0;
  bool get isAudioOnlyTarget => type == 'video' && typeInfo.audioOnlyTargets.contains(targetExt);

  /// Yerel: seçilen kaynak dosyalar [{name, size, mtime}]
  List<Map<String, dynamic>> get sources => ((raw['sources'] as List?) ?? const []).map((x) => (x as Map).cast<String, dynamic>()).toList();
  /// Yerel: iş durumları {name: {status, out, outSize, error}}
  Map<String, dynamic> get outputs => (raw['outputs'] as Map?)?.cast<String, dynamic>() ?? const {};
  int get doneCount => outputs.values.where((x) => x is Map && x['status'] == 'done').length;
  int get errorCount => outputs.values.where((x) => x is Map && x['status'] == 'error').length;

  static Map<String, dynamic> blank({String type = 'video', int concurrency = 2}) {
    final t = kCvTypes[type]!;
    return {
      'createdAt': DateTime.now().millisecondsSinceEpoch, 'name': '', 'type': type, 'sourceExts': [...t.defaultSource], 'targetExt': t.defaultTarget,
      'sourceMode': 'file', 'includeSubfolders': true, 'concurrency': concurrency, 'speech': defaultSpeech(), 'ocr': defaultOcr(),
      'options': defaultOptions(), 'folderId': null, 'color': t.color, 'notes': '',
    };
  }
}

class CvSettings {
  CvSettings(this.raw);
  final Map<String, dynamic> raw;
  int get defaultConcurrency => (raw['defaultConcurrency'] as num?)?.toInt() ?? 2;
  String get speechModel => (raw['speechModel'] ?? 'base').toString();
  int get speechConcurrency => (raw['speechConcurrency'] as num?)?.toInt() ?? 1;
  List<String> get ocrLanguages => ((raw['ocrLanguages'] as List?) ?? const ['tur', 'eng']).map((x) => x.toString()).toList();
  static Map<String, dynamic> blank() => {'appTheme': 'system', 'language': 'tr', 'defaultConcurrency': 2, 'speechModel': 'base', 'speechConcurrency': 1, 'ocrLanguages': ['tur', 'eng']};
}
