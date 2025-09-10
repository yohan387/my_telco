import 'package:intl/intl.dart';

extension PhoneNumberFormatter on String {
  /// Format a string as a phone number, preserving the international prefix (e.g. '+225', '00225', '+33', '0033')
  /// and formatting only the local part: '0123456789' -> '01 23 45 67 89', '+2250123456789' -> '+225 01 23 45 67 89'
  String formatAsPhoneNumber() {
    final trimmed = trim();
    final regex = RegExp(r'^(\+|00)(\d{1,3})');
    String prefix = '';
    String local = trimmed;
    final match = regex.firstMatch(trimmed);
    if (match != null) {
      prefix = match.group(0)!;
      local = trimmed.substring(prefix.length);
    }
    // Remove all non-digit characters from the local part
    final digits = local.replaceAll(RegExp(r'\D'), '');
    final buffer = StringBuffer();
    for (int i = 0; i < digits.length; i++) {
      if (i != 0 && i % 2 == 0) buffer.write(' ');
      buffer.write(digits[i]);
    }
    if (prefix.isNotEmpty) {
      return '$prefix ${buffer.toString()}'.trim();
    } else {
      return buffer.toString();
    }
  }
}

extension Format on int {
  String formatAsAmount() {
    final formattedValue = NumberFormat.decimalPattern('fr').format(this);
    return "$formattedValue FCFA";
  }
}
