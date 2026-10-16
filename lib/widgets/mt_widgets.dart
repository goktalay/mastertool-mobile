// Mastertool ortak bileşenleri — masaüstü common.css ile birebir: düğmeler (.btn / .primary / .ghost / .danger / .sm /
// .icon-btn), girdi + etiket (.field), bölüm başlığı (.section-title), segment (.seg), onay kutusu (.check), hata/uyarı
// kutuları (.error / .notice), toast, hesap rozeti, mastertool.download hapı (.mt-link), marka logosu, uygulama simgesi.
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/theme.dart';

enum MtBtnKind { normal, primary, ghost, danger, dangerPrimary }

class MtButton extends StatelessWidget {
  const MtButton({super.key, required this.label, this.onPressed, this.kind = MtBtnKind.normal, this.icon, this.small = false,
      this.height, this.expand = false, this.busy = false});
  final String label;
  final VoidCallback? onPressed;
  final MtBtnKind kind;
  final IconData? icon;
  final bool small, expand, busy;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final c = MtColors.of(context);
    final h = height ?? (small ? MtDim.btnSmH : MtDim.btnH);
    final grad = kind == MtBtnKind.primary ? MtColors.grad : kind == MtBtnKind.dangerPrimary ? MtColors.dangerGrad : null;
    final fg = switch (kind) {
      MtBtnKind.primary => MtColors.onAccent, MtBtnKind.dangerPrimary => Colors.white, MtBtnKind.danger => c.err, _ => c.text };
    final bg = kind == MtBtnKind.ghost ? Colors.transparent : c.surface2;
    final disabled = onPressed == null || busy;
    final style = (small ? MtText.btnSm : MtText.body).copyWith(color: fg, fontWeight: grad != null ? FontWeight.w600 : FontWeight.w500);
    final child = Row(mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.center, children: [
      if (busy) SizedBox(width: 14, height: 14, child: CircularProgressIndicator(strokeWidth: 2, color: fg))
      else if (icon != null) Icon(icon, size: small ? 14 : 16, color: fg),
      if (busy || icon != null) const SizedBox(width: 8),
      Flexible(child: Text(busy ? '…' : label, style: style, maxLines: 1, overflow: TextOverflow.ellipsis, softWrap: false)),
    ]);
    return Opacity(
      opacity: disabled ? .5 : 1,
      child: Material(
        color: grad == null ? bg : Colors.transparent,
        borderRadius: BorderRadius.circular(MtDim.radiusSm),
        child: Ink(
          height: h,
          decoration: BoxDecoration(gradient: grad, borderRadius: BorderRadius.circular(MtDim.radiusSm),
              border: grad == null && kind != MtBtnKind.ghost ? Border.all(color: c.border) : null),
          child: InkWell(
            borderRadius: BorderRadius.circular(MtDim.radiusSm), onTap: disabled ? null : onPressed,
            child: Padding(padding: EdgeInsets.symmetric(horizontal: small ? 10 : 14), child: Center(child: child)),
          ),
        ),
      ),
    );
  }
}

/// .icon-btn — 28×28, yarıçap 7, text-2
class MtIconButton extends StatelessWidget {
  const MtIconButton({super.key, required this.icon, this.onPressed, this.tooltip, this.size = MtDim.iconBtn, this.color});
  final IconData icon;
  final VoidCallback? onPressed;
  final String? tooltip;
  final double size;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    final c = MtColors.of(context);
    final b = Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(7), onTap: onPressed,
        child: SizedBox(width: size + 8, height: size + 8, child: Icon(icon, size: 18, color: color ?? c.text2)),
      ),
    );
    return tooltip == null ? b : Tooltip(message: tooltip!, child: b);
  }
}

/// .field — etiket 12/500 text-2, 6 px boşluk, 36 px girdi
class MtField extends StatelessWidget {
  const MtField({super.key, required this.label, required this.child, this.hint});
  final String label;
  final Widget child;
  final String? hint;
  @override
  Widget build(BuildContext context) {
    final c = MtColors.of(context);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(label, style: MtText.label.copyWith(color: c.text2)),
      const SizedBox(height: 6),
      child,
      if (hint != null) ...[const SizedBox(height: 6), Text(hint!, style: MtText.small.copyWith(color: c.text3, height: 1.45))],
    ]);
  }
}

/// .section-title — 11.5 / 600 / .8 harf aralığı / BÜYÜK HARF / text-3, sayaç rozeti ve ipucu
class MtSectionTitle extends StatelessWidget {
  const MtSectionTitle(this.title, {super.key, this.count, this.hint});
  final String title;
  final int? count;
  final String? hint;
  @override
  Widget build(BuildContext context) {
    final c = MtColors.of(context);
    return Row(children: [
      Text(title.toUpperCase(), style: MtText.section.copyWith(color: c.text3)),
      if (count != null) ...[
        const SizedBox(width: 8),
        Container(height: 18, padding: const EdgeInsets.symmetric(horizontal: 7), alignment: Alignment.center,
            decoration: BoxDecoration(color: c.surface2, borderRadius: BorderRadius.circular(9), border: Border.all(color: c.border)),
            child: Text('$count', style: TextStyle(fontSize: 11, color: c.text2, fontWeight: FontWeight.w600))),
      ],
      if (hint != null) ...[const SizedBox(width: 10), Flexible(child: Text(hint!, style: MtText.small.copyWith(color: c.text3), overflow: TextOverflow.ellipsis))],
    ]);
  }
}

/// .seg — kap 3 px dolgu, bg-2, yarıçap 9; düğme 6×12, yarıçap 6; seçili surface-3
class MtSegment<T> extends StatelessWidget {
  const MtSegment({super.key, required this.items, required this.value, required this.onChanged});
  final List<(T, String, IconData?)> items;
  final T value;
  final ValueChanged<T> onChanged;
  @override
  Widget build(BuildContext context) {
    final c = MtColors.of(context);
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(color: c.bg2, border: Border.all(color: c.border), borderRadius: BorderRadius.circular(9)),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        for (final it in items)
          Material(
            color: it.$1 == value ? c.surface3 : Colors.transparent, borderRadius: BorderRadius.circular(6),
            child: InkWell(
              borderRadius: BorderRadius.circular(6), onTap: () => onChanged(it.$1),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  if (it.$3 != null) ...[Icon(it.$3, size: 14, color: it.$1 == value ? c.text : c.text2), const SizedBox(width: 6)],
                  Text(it.$2, style: MtText.body.copyWith(color: it.$1 == value ? c.text : c.text2)),
                ]),
              ),
            ),
          ),
      ]),
    );
  }
}

/// .check — 16 px onay kutusu, 10 px boşluk, metin + küçük açıklama (text-3)
class MtCheck extends StatelessWidget {
  const MtCheck({super.key, required this.value, required this.onChanged, required this.label, this.hint});
  final bool value;
  final ValueChanged<bool> onChanged;
  final String label;
  final String? hint;
  @override
  Widget build(BuildContext context) {
    final c = MtColors.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(6), onTap: () => onChanged(!value),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(width: 16, height: 20, child: Checkbox(value: value, onChanged: (v) => onChanged(v ?? false))),
          const SizedBox(width: 10),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(label, style: MtText.body.copyWith(color: c.text)),
            if (hint != null) Text(hint!, style: MtText.small.copyWith(color: c.text3, height: 1.45)),
          ])),
        ]),
      ),
    );
  }
}

/// .error / .notice / .sso-hint kutuları
enum MtBoxKind { error, notice, info }

class MtBox extends StatelessWidget {
  const MtBox(this.text, {super.key, this.kind = MtBoxKind.info, this.icon});
  final String text;
  final MtBoxKind kind;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    final c = MtColors.of(context);
    final tone = switch (kind) { MtBoxKind.error => c.err, MtBoxKind.notice => c.warn, MtBoxKind.info => c.accent };
    final bg = kind == MtBoxKind.info ? c.surface : tone.withValues(alpha: .08);
    final border = kind == MtBoxKind.info ? c.border : tone.withValues(alpha: .45);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(9), border: Border.all(color: border)),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (icon != null) ...[Icon(icon, size: 14, color: tone), const SizedBox(width: 8)],
        Expanded(child: Text(text, style: TextStyle(fontSize: kind == MtBoxKind.info ? 12 : 12.5, height: kind == MtBoxKind.info ? 1.5 : 1.45,
            color: kind == MtBoxKind.error ? c.err : c.text))),
      ]),
    );
  }
}

/// toast — sağ/alt, 3 px sol şerit (accent / ok / err), 12.5/600 başlık
void mtToast(BuildContext context, String title, {String? sub, String type = ''}) {
  final c = MtColors.of(context);
  final tone = type == 'ok' ? c.ok : type == 'err' ? c.err : c.accent;
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: Duration(milliseconds: type == 'err' ? 9000 : 4000),
    padding: EdgeInsets.zero,
    content: Container(
      decoration: BoxDecoration(border: Border(left: BorderSide(color: tone, width: 3)), borderRadius: const BorderRadius.horizontal(left: Radius.circular(10))),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
        Text(title, style: MtText.btnSm.copyWith(color: c.text, fontWeight: FontWeight.w600)),
        if (sub != null) Text(sub, style: MtText.tiny.copyWith(color: c.text2)),
      ]),
    ),
  ));
}

/// Marka logosu (M, geçişli kare): üst çubuk 38 / yarıçap 10; giriş 72 / yarıçap 18, camgöbeği parıltı
class BrandLogo extends StatelessWidget {
  const BrandLogo({super.key, this.size = 38, this.radius, this.glow = true});
  final double size;
  final double? radius;
  final bool glow;
  @override
  Widget build(BuildContext context) => Container(
        width: size, height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? size * .26),
          boxShadow: glow ? [BoxShadow(color: const Color(0xFF22D3EE).withValues(alpha: size > 50 ? .22 : .18), blurRadius: size > 50 ? 28 : 18, offset: Offset(0, size > 50 ? 10 : 6))] : null,
        ),
        child: SvgPicture.asset('assets/brand/mt.svg', width: size, height: size),
      );
}

/// Uygulama / modül simgesi (brand SVG) — kutucukta 84 px, yarıçap 20, camgöbeği gölge
class AppIcon extends StatelessWidget {
  const AppIcon(this.app, {super.key, this.size = MtDim.tileIcon, this.dim = false});
  final String app;
  final double size;
  final bool dim;
  @override
  Widget build(BuildContext context) {
    Widget w = SvgPicture.asset('assets/brand/$app.svg', width: size, height: size);
    if (dim) {
      w = ColorFiltered(colorFilter: const ColorFilter.matrix([.2126, .7152, .0722, 0, 0, .2126, .7152, .0722, 0, 0, .2126, .7152, .0722, 0, 0, 0, 0, 0, 1, 0]),
          child: Opacity(opacity: .45, child: w));
    }
    return Container(
      decoration: dim ? null : BoxDecoration(borderRadius: BorderRadius.circular(size * .24),
          boxShadow: [BoxShadow(color: const Color(0xFF22D3EE).withValues(alpha: .18), blurRadius: 18, offset: const Offset(0, 8))]),
      child: w,
    );
  }
}

/// Hesap rozeti — 34 px hap, 28 px geçişli avatar (baş harf 13/700), ad 12.5/600 (dar ekranda gizli)
class AccountBadge extends StatelessWidget {
  const AccountBadge({super.key, required this.name, this.onTap, this.showName = true});
  final String name;
  final VoidCallback? onTap;
  final bool showName;
  @override
  Widget build(BuildContext context) {
    final c = MtColors.of(context);
    final initial = name.trim().isEmpty ? '?' : name.trim().characters.first.toUpperCase();
    return Material(
      color: c.surface2, borderRadius: BorderRadius.circular(999),
      child: InkWell(
        borderRadius: BorderRadius.circular(999), onTap: onTap,
        child: Container(
          height: 34, padding: EdgeInsets.only(left: 3, right: showName ? 12 : 3),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(999), border: Border.all(color: c.border)),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            Container(width: 28, height: 28, alignment: Alignment.center, decoration: const BoxDecoration(gradient: MtColors.grad, shape: BoxShape.circle),
                child: Text(initial, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: MtColors.onAccent))),
            if (showName) ...[const SizedBox(width: 8), ConstrainedBox(constraints: const BoxConstraints(maxWidth: 220),
                child: Text(name, overflow: TextOverflow.ellipsis, style: MtText.btnSm.copyWith(color: c.text, fontWeight: FontWeight.w600)))],
          ]),
        ),
      ),
    );
  }
}

/// .mt-link — "mastertool.download ↗" hapı (32 px, surface-2, kenarlık; dar ekranda yalnız simge)
class MtLink extends StatelessWidget {
  const MtLink({super.key, required this.url, this.compact = false});
  final String url;
  final bool compact;
  @override
  Widget build(BuildContext context) {
    final c = MtColors.of(context);
    return Material(
      color: c.surface2, borderRadius: BorderRadius.circular(999),
      child: InkWell(
        borderRadius: BorderRadius.circular(999),
        onTap: () => launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication),
        child: Container(
          height: 32, padding: EdgeInsets.symmetric(horizontal: compact ? 7 : 12),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(999), border: Border.all(color: c.border)),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            ClipRRect(borderRadius: BorderRadius.circular(5), child: SvgPicture.asset('assets/brand/mt.svg', width: 18, height: 18)),
            if (!compact) ...[
              const SizedBox(width: 8),
              Text('mastertool.download', style: MtText.btnSm.copyWith(color: c.text2, fontWeight: FontWeight.w600, letterSpacing: .1)),
              const SizedBox(width: 6),
              Icon(Icons.north_east, size: 13, color: c.text2.withValues(alpha: .7)),
            ],
          ]),
        ),
      ),
    );
  }
}

/// Ana pencere arka planı: iki radyal geçiş + bg (app.css:3-8); giriş için daha yoğun değerler (login.css:1-7)
class MtBackground extends StatelessWidget {
  const MtBackground({super.key, required this.child, this.login = false});
  final Widget child;
  final bool login;
  @override
  Widget build(BuildContext context) {
    final c = MtColors.of(context);
    final a1 = login ? .14 : .10, a2 = login ? .10 : .07;
    return Container(
      color: c.bg,
      child: Stack(fit: StackFit.expand, children: [
        Positioned(right: -200, top: -150, child: _blob(const Color(0xFF6366F1).withValues(alpha: a1), 1000, 500)),
        Positioned(left: -300, bottom: -200, child: _blob(const Color(0xFF22D3EE).withValues(alpha: a2), 800, 450)),
        child,
      ]),
    );
  }

  Widget _blob(Color color, double w, double h) => IgnorePointer(
        child: Container(width: w, height: h, decoration: BoxDecoration(shape: BoxShape.circle,
            gradient: RadialGradient(colors: [color, color.withValues(alpha: 0)], stops: const [0, .6]))),
      );
}

/// Dönen küçük halka (14 px, 2 px)
class MtSpinner extends StatelessWidget {
  const MtSpinner({super.key, this.size = 14, this.color});
  final double size;
  final Color? color;
  @override
  Widget build(BuildContext context) => SizedBox(width: size, height: size, child: CircularProgressIndicator(strokeWidth: 2, color: color ?? MtColors.of(context).accent));
}
