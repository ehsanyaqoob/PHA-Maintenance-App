import 'package:pharesidence/Utils/exports/exports.dart';

class CNICInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue,
      TextEditingValue newValue) {
    String newText = newValue.text.replaceAll('-', '');

    // Restrict to a maximum of 13 characters (CNIC without dashes)
    if (newText.length > 13) {
      newText = newText.substring(0, 13);
    }

    // Format text with dashes
    String formattedText = '';
    for (int i = 0; i < newText.length; i++) {
      if (i == 5 || i == 12) {
        formattedText += '-';
      }
      formattedText += newText[i];
    }

    return newValue.copyWith(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}

class PakistaniPhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text.replaceAll('-', '');

    // Restrict to a maximum of 11 characters (phone number without dashes)
    if (newText.length > 11) {
      newText = newText.substring(0, 11);
    }

    // Format text with dashes
    String formattedText = '';
    for (int i = 0; i < newText.length; i++) {
      if (i == 4) {
        formattedText += '-';
      }
      formattedText += newText[i];
    }

    return newValue.copyWith(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}