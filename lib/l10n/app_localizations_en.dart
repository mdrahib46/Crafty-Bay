// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get version => 'Version';

  @override
  String get firstName => 'First Name';

  @override
  String get lastName => 'Last Name';

  @override
  String get mobile => 'Mobile';

  @override
  String get city => 'City';

  @override
  String get shippingAddress => 'Shipping Address';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get createAnAccount => 'Create An Account';

  @override
  String get signUpWithEmailPassword => 'Sign up with your email and password';

  @override
  String get signUp => 'Sign Up';

  @override
  String get alreadyHaveAnAccount => 'Already have an account? ';

  @override
  String get signIn => 'Sign In';

  @override
  String get enterEmail => 'Enter your email!';

  @override
  String get enterFirstName => 'Enter your first name!';

  @override
  String get enterLastName => 'Enter your last name!';

  @override
  String get enterCity => 'Enter your city!';

  @override
  String get verifyYourOtp => 'Verify Your OTP';

  @override
  String get otpSentToEmail =>
      'A 4 digit OTP has been sent to your email address';

  @override
  String get verify => 'Verify';

  @override
  String get resendOtp => 'Resend OTP';

  @override
  String get otpExpireMessage => 'This code will expire in ';
}
