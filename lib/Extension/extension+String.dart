import 'package:intl/intl.dart';

extension NumberFormatter on String {
  /// Formats a string containing a number to have commas and rounded to 2 decimal places
  String formatAsNumber() {
    try {
      double number = double.parse(this);
      NumberFormat formatter = NumberFormat("#,##0.00");
      return formatter.format(number);
    } catch (e) {
      return this;
    }
  }
}

extension DateFormatter on String {
  /// Converts a date string in 'yyyy-MM-dd' format to 'MMM d, yyyy' format
  String formatDate() {
    try {
      // Parse the string to a DateTime object
      DateTime date = DateFormat('yyyy-MM-dd').parse(this);

      // Format the date to 'Jul 13, 2019' style
      String formattedDate = DateFormat('MMM d, yyyy').format(date);

      return formattedDate;
    } catch (e) {
      // If parsing fails, return the original string
      return this;
    }
  }
}

extension CNICFormat on String {
  String formatCNIC() {
    if (this.length != 13) {
      throw ArgumentError('Invalid CNIC length. It should be 13 digits long.');
    }

    // Insert hyphens at the desired positions
    String formatted = '${this.substring(0, 5)}-${this.substring(5, 12)}-${this.substring(12)}';

    return formatted;
  }
}

extension PhoneFormat on String {
  String formatPhoneNumber() {
    if (this.length != 11) {
      throw ArgumentError('Invalid phone number length. It should be 11 digits long.');
    }

    // Insert a hyphen after the first 4 digits
    String formatted = '${this.substring(0, 4)}-${this.substring(4)}';

    return formatted;
  }
}