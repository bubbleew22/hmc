/// Input validation helpers shared by forms.
class Validators {
  static String? required(String? v, [String label = 'This field']) =>
      (v == null || v.trim().isEmpty) ? '$label is required' : null;

  static String? money(String? v,
      {bool allowZero = true, String label = 'Amount'}) {
    if (v == null || v.trim().isEmpty) return '$label is required';
    final cleaned = v.replaceAll(RegExp(r'[,\s]'), '');
    final d = double.tryParse(cleaned);
    if (d == null) return 'Enter a valid $label';
    if (d < 0) return '$label cannot be negative';
    if (!allowZero && d == 0) return '$label must be greater than zero';
    return null;
  }

  static String? quantity(String? v) {
    if (v == null || v.trim().isEmpty) return 'Quantity is required';
    final q = int.tryParse(v.trim());
    if (q == null || q <= 0) return 'Enter a valid quantity';
    return null;
  }

  static String? phone(String? v, {bool required = false}) {
    final t = (v ?? '').trim();
    if (t.isEmpty) return required ? 'Phone number is required' : null;
    final digits = t.replaceAll(RegExp(r'\D'), '');
    if (digits.length < 10 || digits.length > 13) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  /// IMEI is 15 digits; some devices use 16-17 char serials — allow those
  /// but flag anything else. Returns null when valid/empty.
  static String? imei(String? v, {bool required = false}) {
    final t = (v ?? '').trim();
    if (t.isEmpty) return required ? 'IMEI is required' : null;
    if (RegExp(r'^\d{15}$').hasMatch(t)) return null;
    if (RegExp(r'^[A-Za-z0-9]{8,20}$').hasMatch(t)) {
      return null; // legitimate alternate serial format
    }
    return 'Enter a valid 15-digit IMEI or serial';
  }

  /// Luhn check for IMEI (informational — not a hard block).
  static bool imeiLuhnValid(String imei) {
    if (!RegExp(r'^\d{15}$').hasMatch(imei)) return false;
    var sum = 0;
    for (var i = 0; i < 14; i++) {
      var d = int.parse(imei[i]);
      if (i.isOdd) {
        d *= 2;
        if (d > 9) d -= 9;
      }
      sum += d;
    }
    return (10 - (sum % 10)) % 10 == int.parse(imei[14]);
  }

  static String? pin(String? v) {
    if (v == null || v.length < 4) return 'PIN must be at least 4 digits';
    if (!RegExp(r'^\d{4,8}$').hasMatch(v)) return 'PIN must be 4-8 digits';
    return null;
  }
}
