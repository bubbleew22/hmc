/// Global application configuration.
///
/// Cloud integration is intentionally DISABLED in this build.
/// See [CloudConfig] for the future-sync seams.
class AppConfig {
  static const String appName = 'Hassan Mobile Center';
  static const String appSubtitle = 'Shewa Adda';
  static const String appTagline = 'Smart Mobile Business Management';
  static const String packageName = 'com.hasanmobilecenter.shewaadda';
  static const String version = '1.0.0';
  static const int dbVersion = 2;

  static const String defaultCurrency = 'PKR';
  static const String currencySymbol = 'Rs';

  /// All money is stored as integer minor units (paisa).
  /// 1 PKR = 100 minor units.
  static const int minorUnitsPerMajor = 100;

  /// Pakistan local timezone offset used for business-date display.
  /// Stored timestamps are UTC epoch millis; display converts to PKT.
  static const Duration pakistanOffset = Duration(hours: 5);

  static const int defaultLowStockThreshold = 5;
  static const int bcryptRoundsNote = 0; // PINs use salted SHA-256 (see AuthService)

  /// Feature flags — all cloud features OFF.
  static const bool cloudEnabled = false;
  static const bool syncEnabled = false;
  static const bool requireOnlineLogin = false;
}
