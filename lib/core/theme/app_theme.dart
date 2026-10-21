import 'package:flutter/material.dart';

/// HMC brand palette, shifted toward the product mockup:
/// royal-blue app bars, white 16px cards, light slate background,
/// gold accents, green/red status colors.
class HmcColors {
  static const navy900 = Color(0xFF0B1B33);
  static const navy800 = Color(0xFF10254A);
  static const navy700 = Color(0xFF16345F);
  static const royal = Color(0xFF1B3A9B);
  static const royalDark = Color(0xFF142B73);
  static const blue600 = Color(0xFF2563EB);
  static const blue400 = Color(0xFF60A5FA);
  static const gold600 = Color(0xFFB8860B);
  static const gold500 = Color(0xFFD4A017);
  static const gold300 = Color(0xFFE8C766);
  static const paper = Color(0xFFF1F4F9);
  static const success = Color(0xFF16A34A);
  static const successBg = Color(0xFFE7F6EC);
  static const warning = Color(0xFFD97706);
  static const warningBg = Color(0xFFFEF3E2);
  static const danger = Color(0xFFDC2626);
  static const dangerBg = Color(0xFFFDECEC);
  static const slate = Color(0xFF64748B);
  static const slateBg = Color(0xFFE8EDF5);

  /// Approximate official brand colors for the catalogue grid.
  static Color brandColor(String name) {
    final n = name.toLowerCase().trim();
    if (n.contains('apple')) return const Color(0xFF111111);
    if (n.contains('samsung')) return const Color(0xFF1428A0);
    if (n.contains('infinix')) return const Color(0xFF1DB954);
    if (n.contains('vivo')) return const Color(0xFF415FFF);
    if (n.contains('tecno')) return const Color(0xFF0A66C2);
    if (n.contains('xiaomi') || n == 'mi') return const Color(0xFFFF6900);
    if (n.contains('oppo')) return const Color(0xFF00854A);
    if (n.contains('realme')) return const Color(0xFFFFC915);
    if (n.contains('oneplus')) return const Color(0xFFEB0028);
    if (n.contains('motorola') || n.contains('moto')) {
      return const Color(0xFF0A66C2);
    }
    if (n.contains('nokia')) return const Color(0xFF124191);
    if (n.contains('google') || n.contains('pixel')) {
      return const Color(0xFF4285F4);
    }
    if (n.contains('huawei')) return const Color(0xFFCF0A2C);
    // Fallback: deterministic color from the name.
    final hash = n.hashCode.abs();
    const palette = [
      Color(0xFF7C3AED),
      Color(0xFF0891B2),
      Color(0xFFDB2777),
      Color(0xFF65A30D),
      Color(0xFFEA580C),
    ];
    return palette[hash % palette.length];
  }
}

class AppTheme {
  static ThemeData light() {
    final scheme = ColorScheme.fromSeed(
      seedColor: HmcColors.royal,
      brightness: Brightness.light,
    ).copyWith(
      primary: HmcColors.royal,
      onPrimary: Colors.white,
      secondary: HmcColors.gold600,
      tertiary: HmcColors.blue600,
      surface: Colors.white,
      error: HmcColors.danger,
    );
    return _base(scheme, Brightness.light);
  }

  static ThemeData dark() {
    final scheme = ColorScheme.fromSeed(
      seedColor: HmcColors.navy800,
      brightness: Brightness.dark,
    ).copyWith(
      primary: HmcColors.blue400,
      secondary: HmcColors.gold300,
      tertiary: HmcColors.blue400,
      surface: const Color(0xFF111A2E),
    );
    return _base(scheme, Brightness.dark);
  }

  static ThemeData _base(ColorScheme scheme, Brightness brightness) {
    final isLight = brightness == Brightness.light;
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      brightness: brightness,
      scaffoldBackgroundColor:
          isLight ? HmcColors.paper : scheme.surface,
      cardTheme: CardThemeData(
        elevation: 0,
        color: isLight ? Colors.white : scheme.surfaceContainerLow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor:
            isLight ? HmcColors.royal : scheme.surface,
        foregroundColor: isLight ? Colors.white : scheme.onSurface,
        titleTextStyle: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.w700,
          color: isLight ? Colors.white : scheme.onSurface,
        ),
        iconTheme: IconThemeData(
          color: isLight ? Colors.white : scheme.onSurface,
        ),
        actionsIconTheme: IconThemeData(
          color: isLight ? Colors.white : scheme.onSurface,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: scheme.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: scheme.primary, width: 2),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
        filled: true,
        fillColor: isLight ? Colors.white : null,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: HmcColors.royal,
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: HmcColors.royal,
        unselectedItemColor: Color(0xFF9AA3B2),
        selectedLabelStyle:
            TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
        unselectedLabelStyle:
            TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        elevation: 8,
      ),
      chipTheme: ChipThemeData(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      dialogTheme: DialogThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      dividerTheme: const DividerThemeData(space: 1),
    );
  }

  static ThemeMode parseMode(String value) => switch (value) {
        'light' => ThemeMode.light,
        'dark' => ThemeMode.dark,
        _ => ThemeMode.system,
      };

  static String modeName(ThemeMode mode) => switch (mode) {
        ThemeMode.light => 'light',
        ThemeMode.dark => 'dark',
        ThemeMode.system => 'system',
      };
}
