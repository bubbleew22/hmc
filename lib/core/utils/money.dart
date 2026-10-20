import 'package:intl/intl.dart';

import '../config/app_config.dart';

/// Exact money handling: all amounts are integer minor units (paisa).
/// Never use double for financial math.
class Money {
  static const int perMajor = AppConfig.minorUnitsPerMajor;

  /// Convert rupees (major units) to minor units, rounding half away from zero.
  static int fromMajor(num major) => (major * perMajor).round();

  /// Parse a user-typed rupee string like "60,000" or "60000.50".
  /// Returns minor units, or null when unparsable.
  static int? tryParseMajor(String input) {
    final cleaned = input.replaceAll(RegExp(r'[,\s]'), '').trim();
    if (cleaned.isEmpty) return null;
    final value = double.tryParse(cleaned);
    if (value == null || value.isNaN || value.isInfinite) return null;
    return (value * perMajor).round();
  }

  static double toMajor(int minor) => minor / perMajor;

  static final _fmt = NumberFormat('#,##0', 'en_PK');
  static final _fmtDec = NumberFormat('#,##0.00', 'en_PK');

  /// "Rs 60,000" — drops paisa when zero for compact displays.
  static String format(int minor, {bool withSymbol = true}) {
    final major = minor ~/ perMajor;
    final paisa = minor.abs() % perMajor;
    final sign = minor < 0 ? '-' : '';
    final abs = _fmt.format(major.abs());
    final body = paisa == 0 ? abs : _fmtDec.format(minor.abs() / perMajor);
    return '${withSymbol ? '${AppConfig.currencySymbol} ' : ''}$sign$body';
  }

  /// Compact input helper: formats minor units as editable major text.
  static String toEditable(int minor) {
    final paisa = minor % perMajor;
    if (paisa == 0) return (minor ~/ perMajor).toString();
    return (minor / perMajor).toStringAsFixed(2);
  }
}
