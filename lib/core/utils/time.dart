import 'package:intl/intl.dart';

import '../config/app_config.dart';

/// Timestamps are stored as UTC epoch millis. Business dates display in
/// Pakistan local time (PKT, UTC+5) by default.
class PkTime {
  static DateTime toLocal(DateTime utc) =>
      utc.toUtc().add(AppConfig.pakistanOffset);

  static DateTime fromEpochMs(int ms) =>
      toLocal(DateTime.fromMillisecondsSinceEpoch(ms, isUtc: true));

  static int nowEpochMs() => DateTime.now().toUtc().millisecondsSinceEpoch;

  /// Start/end of "today" in PKT, returned as UTC epoch millis.
  static (int, int) todayRange() {
    final now = DateTime.now().toUtc().add(AppConfig.pakistanOffset);
    final start = DateTime(now.year, now.month, now.day)
        .subtract(AppConfig.pakistanOffset);
    final end = start.add(const Duration(days: 1));
    return (start.millisecondsSinceEpoch, end.millisecondsSinceEpoch);
  }

  static String formatDate(int epochMs, {String pattern = 'dd/MM/yyyy'}) =>
      DateFormat(pattern).format(fromEpochMs(epochMs));

  static String formatDateTime(int epochMs) =>
      DateFormat('dd/MM/yyyy hh:mm a').format(fromEpochMs(epochMs));
}
