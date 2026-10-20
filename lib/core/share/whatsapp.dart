import 'package:url_launcher/url_launcher.dart';

/// WhatsApp payment reminders via wa.me deep links.
/// Opens the customer's WhatsApp chat with a prefilled message —
/// the user taps send inside WhatsApp. No API keys, no extra SDK.
class WhatsApp {
  /// Normalizes a Pakistani mobile number to international format digits.
  /// "0301-2345678" -> "923012345678", "+92 301 2345678" -> "923012345678".
  static String normalizePhone(String raw) {
    var digits = raw.replaceAll(RegExp(r'\D'), '');
    if (digits.startsWith('0')) digits = '92${digits.substring(1)}';
    return digits;
  }

  static bool canSendTo(String raw) {
    final digits = normalizePhone(raw);
    return digits.length >= 11 && digits.length <= 13;
  }

  static Uri reminderLink(String rawPhone, String message) {
    final phone = normalizePhone(rawPhone);
    return Uri.parse(
        'https://wa.me/$phone?text=${Uri.encodeComponent(message)}');
  }

  static Future<bool> sendReminder(String rawPhone, String message) async {
    final uri = reminderLink(rawPhone, message);
    return launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  /// Builds the reminder text from the shop's template (Settings) with
  /// {name}, {amount}, {shop} placeholders.
  static String buildMessage({
    required String template,
    required String customerName,
    required String amountText,
    required String shopName,
  }) {
    var t = template.trim();
    if (t.isEmpty) t = defaultTemplate;
    return t
        .replaceAll('{name}', customerName)
        .replaceAll('{amount}', amountText)
        .replaceAll('{shop}', shopName);
  }

  static const defaultTemplate =
      'Assalam-o-Alaikum {name}! {shop} ki taraf se yaad-dihani: '
      'aap ka {amount} ka hisaab baqi hai. '
      'Barah-e-karam jald ada farma dein. Shukriya!';
}
