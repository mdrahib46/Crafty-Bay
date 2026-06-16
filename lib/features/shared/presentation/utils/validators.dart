import 'package:email_validator/email_validator.dart';

class Validators {
  Validators._();

  static String? validateInput(String? input, String message) {
    if (input == null || input.trim().isEmpty) {
      return message;
    }
    return null;
  }

  static String? validateEmail(String? input) {
    if (input == null || input.trim().isEmpty) {
      return 'Enter your email address';
    }

    if (!EmailValidator.validate(input.trim())) {
      return 'Enter a valid email address';
    }

    return null;
  }

  static String? validateMobile(String? input) {
    final bdPhoneRegex = RegExp(r'^(?:(?:\+|00)88)?01[3-9]\d{8}$');

    if (input == null || input.trim().isEmpty) {
      return 'Enter your mobile number';
    }

    if (!bdPhoneRegex.hasMatch(input.trim())) {
      return 'Enter a valid mobile number';
    }

    return null;
  }

  static String? validatePassword(String? input) {
    if ((input ?? '').length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  static String? validateConfirmPassword(
      String? input,
      String password,
      ) {
    if (input != password) {
      return 'Confirm password does not match!';
    }
    return null;
  }
}