import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';

/// Text-based brand badges styled after each brand's identity.
/// No trademarked image assets — typography and brand colors only,
/// matching the product mockup's brand grid.
class BrandLogo extends StatelessWidget {
  final String brandName;
  final double height;

  const BrandLogo({super.key, required this.brandName, this.height = 36});

  @override
  Widget build(BuildContext context) {
    final n = brandName.toLowerCase().trim();
    final scale = height / 36;

    Widget logo;
    if (n.contains('apple')) {
      logo = _text('Apple', const Color(0xFF111111),
          weight: FontWeight.w800, size: 21 * scale, spacing: -0.5);
    } else if (n.contains('samsung')) {
      logo = _text('SAMSUNG', const Color(0xFF1428A0),
          weight: FontWeight.w800, size: 15 * scale, spacing: 2.0);
    } else if (n.contains('google') || n.contains('pixel')) {
      logo = _googleText(scale);
    } else if (n.contains('infinix')) {
      logo = _text('Infinix', const Color(0xFF1DB954),
          weight: FontWeight.w800, size: 20 * scale, italic: true);
    } else if (n.contains('vivo')) {
      logo = _text('vivo', const Color(0xFF415FFF),
          weight: FontWeight.w800, size: 22 * scale, spacing: 0.5);
    } else if (n.contains('tecno')) {
      logo = _text('TECNO', const Color(0xFF0A66C2),
          weight: FontWeight.w800, size: 18 * scale, spacing: 3.0);
    } else if (n.contains('xiaomi') || n == 'mi') {
      logo = _badge('mi', const Color(0xFFFF6900), Colors.white, 15 * scale);
    } else if (n.contains('redmi')) {
      logo = _text('Redmi', const Color(0xFFE8590C),
          weight: FontWeight.w800, size: 20 * scale);
    } else if (n.contains('poco')) {
      logo = _pill('POCO', const Color(0xFFFFD400), const Color(0xFF111111),
          15 * scale);
    } else if (n.contains('oppo')) {
      logo = _text('oppo', const Color(0xFF00854A),
          weight: FontWeight.w700, size: 22 * scale, spacing: 1.0);
    } else if (n.contains('realme')) {
      logo = _pill('realme', const Color(0xFFFFC915), const Color(0xFF111111),
          15 * scale);
    } else if (n.contains('oneplus') || n.contains('one plus')) {
      logo = _badge('1+', const Color(0xFFEB0028), Colors.white, 15 * scale);
    } else if (n.contains('motorola') || n == 'moto') {
      logo = _circleBadge('M', const Color(0xFF0A66C2), 17 * scale);
    } else if (n.contains('nokia')) {
      logo = _text('NOKIA', const Color(0xFF124191),
          weight: FontWeight.w800, size: 17 * scale, spacing: 4.0);
    } else if (n.contains('nothing')) {
      logo = _text('NOTHING', const Color(0xFF111111),
          weight: FontWeight.w700, size: 15 * scale, spacing: 2.5, mono: true);
    } else if (n.contains('huawei')) {
      logo = _text('HUAWEI', const Color(0xFFCF0A2C),
          weight: FontWeight.w800, size: 16 * scale, spacing: 2.0);
    } else if (n.contains('honor')) {
      logo = _text('HONOR', const Color(0xFF5B5BD6),
          weight: FontWeight.w800, size: 17 * scale, spacing: 3.0);
    } else if (n.contains('itel')) {
      logo = _text('itel', const Color(0xFF0A66C2),
          weight: FontWeight.w800, size: 21 * scale, italic: true);
    } else if (n.contains('sony')) {
      logo = _text('SONY', const Color(0xFF111111),
          weight: FontWeight.w700, size: 17 * scale, spacing: 5.0);
    } else {
      // Fallback: first letter in a deterministic brand-colored circle.
      final initial =
          brandName.trim().isEmpty ? '?' : brandName.trim()[0].toUpperCase();
      logo = _circleBadge(initial, HmcColors.brandColor(brandName), 17 * scale);
    }

    return SizedBox(
      height: height,
      child: Center(child: logo),
    );
  }

  static Widget _text(String s, Color color,
      {required FontWeight weight,
      required double size,
      double spacing = 0,
      bool italic = false,
      bool mono = false}) {
    return Text(
      s,
      style: TextStyle(
        color: color,
        fontWeight: weight,
        fontSize: size,
        letterSpacing: spacing,
        fontStyle: italic ? FontStyle.italic : FontStyle.normal,
        fontFamily: mono ? 'monospace' : null,
        height: 1.0,
      ),
    );
  }

  /// Solid rounded-square badge with short text (e.g. "mi", "1+").
  static Widget _badge(String s, Color bg, Color fg, double size) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: size * 0.55, vertical: size * 0.32),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(size * 0.35),
      ),
      child: Text(
        s,
        style: TextStyle(
          color: fg,
          fontWeight: FontWeight.w800,
          fontSize: size,
          height: 1.0,
        ),
      ),
    );
  }

  /// Pill badge (e.g. "realme", "POCO").
  static Widget _pill(String s, Color bg, Color fg, double size) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: size * 0.7, vertical: size * 0.35),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(size * 0.8),
      ),
      child: Text(
        s,
        style: TextStyle(
          color: fg,
          fontWeight: FontWeight.w800,
          fontSize: size,
          letterSpacing: 0.5,
          height: 1.0,
        ),
      ),
    );
  }

  /// Circular badge with a single letter (Motorola "M", fallbacks).
  static Widget _circleBadge(String s, Color bg, double size) {
    final d = size * 2.1;
    return Container(
      width: d,
      height: d,
      decoration: BoxDecoration(color: bg, shape: BoxShape.circle),
      alignment: Alignment.center,
      child: Text(
        s,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w800,
          fontSize: size,
          height: 1.0,
        ),
      ),
    );
  }

  /// Google-style multicolor wordmark.
  static Widget _googleText(double scale) {
    const colors = [
      Color(0xFF4285F4), // G blue
      Color(0xFFEA4335), // o red
      Color(0xFFFBBC05), // o yellow
      Color(0xFF4285F4), // g blue
      Color(0xFF34A853), // l green
      Color(0xFFEA4335), // e red
    ];
    const letters = ['G', 'o', 'o', 'g', 'l', 'e'];
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 21 * scale,
          height: 1.0,
          letterSpacing: -0.5,
        ),
        children: [
          for (var i = 0; i < letters.length; i++)
            TextSpan(
                text: letters[i], style: TextStyle(color: colors[i])),
        ],
      ),
    );
  }
}

/// A catalogue grid tile: brand logo, brand name, model count —
/// matching the mockup's Brands screen.
class BrandTile extends StatelessWidget {
  final String brandName;
  final int modelCount;
  final bool archived;
  final VoidCallback onTap;
  final Widget? trailingMenu;

  const BrandTile({
    super.key,
    required this.brandName,
    required this.modelCount,
    required this.onTap,
    this.archived = false,
    this.trailingMenu,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(4),
      child: Stack(
        children: [
          Positioned.fill(
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 30, 8, 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BrandLogo(brandName: brandName, height: 34),
                    const SizedBox(height: 8),
                    Text(
                      brandName,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: archived
                            ? HmcColors.slate
                            : Theme.of(context).colorScheme.onSurface,
                        decoration: archived
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '$modelCount Models',
                      style: const TextStyle(
                        fontSize: 12,
                        color: HmcColors.slate,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (trailingMenu != null)
            Positioned(top: 2, right: 2, child: trailingMenu!),
        ],
      ),
    );
  }
}

/// Clean vector-style phone illustration placeholder for stock/model rows.
/// Drawn with a CustomPainter — no photo assets needed.
class PhoneThumb extends StatelessWidget {
  final double size;
  final Color? accent;

  const PhoneThumb({super.key, this.size = 48, this.accent});

  @override
  Widget build(BuildContext context) {
    final a = accent ?? HmcColors.royal;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            a.withValues(alpha: 0.14),
            a.withValues(alpha: 0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(size * 0.28),
        border: Border.all(color: a.withValues(alpha: 0.18)),
      ),
      child: Center(
        child: CustomPaint(
          size: Size(size * 0.44, size * 0.62),
          painter: _PhonePainter(color: a),
        ),
      ),
    );
  }
}

class _PhonePainter extends CustomPainter {
  final Color color;
  _PhonePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final r = w * 0.28;

    // Body.
    final bodyPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [color, color.withValues(alpha: 0.72)],
      ).createShader(Rect.fromLTWH(0, 0, w, h));
    final bodyRRect = RRect.fromLTRBR(
        0, 0, w, h, Radius.circular(r));
    canvas.drawRRect(bodyRRect, bodyPaint);

    // Screen.
    final screenPaint = Paint()..color = Colors.white.withValues(alpha: 0.92);
    final padX = w * 0.14;
    final padTop = h * 0.10;
    final padBottom = h * 0.07;
    canvas.drawRRect(
      RRect.fromLTRBR(padX, padTop, w - padX, h - padBottom,
          Radius.circular(r * 0.55)),
      screenPaint,
    );

    // Camera dot.
    final camPaint = Paint()..color = Colors.white.withValues(alpha: 0.85);
    canvas.drawCircle(
        Offset(w / 2, padTop * 0.5), w * 0.055, camPaint);

    // Screen shimmer.
    final shimmerPaint = Paint()
      ..color = color.withValues(alpha: 0.10);
    final shimmerPath = Path()
      ..moveTo(padX, h * 0.62)
      ..lineTo(w * 0.62, padTop)
      ..lineTo(w - padX, padTop)
      ..lineTo(w - padX, h * 0.42)
      ..close();
    canvas.save();
    canvas.clipRRect(RRect.fromLTRBR(padX, padTop, w - padX, h - padBottom,
        Radius.circular(r * 0.55)));
    canvas.drawPath(shimmerPath, shimmerPaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
