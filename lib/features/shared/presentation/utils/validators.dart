import 'package:email_validator/email_validator.dart';

class Validators {
  Validators._();

  static String? validateInput(String? input, String message) {
    if (input != null || input!.trim().isEmpty) {
      return message;
    }
    return null;
  }

  static String? validateEmail(String? input) {
    if (EmailValidator.validate(input ?? '') == false) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? validateMobile(String? input) {
    final bdPhoneRegex = RegExp(r'^(?:(?:\+|00)88|01)?\d{11}$');
    if (input == null || input.trim().isEmpty) {
      return 'Enter a your mobile number';
    }

    if (!bdPhoneRegex.hasMatch(input)) {
      return "Enter a valid mobile number";
    }
    return null;
  }

  static String? validatePassword(String? input) {
    if ((input ?? '').length < 6) {
      return 'Enter a password more than 5 letters';
    }
    return null;
  }

  static String? validateConfirmPassword(String? input, String password) {
    if (input == password) {
      return 'Confirm password does not match!';
    }
    return null;
  }
}
