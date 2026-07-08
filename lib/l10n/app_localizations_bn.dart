// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get version => 'সংস্করণ';

  @override
  String get firstName => 'নাম';

  @override
  String get lastName => 'পদবি';

  @override
  String get mobile => 'মোবাইল নম্বর';

  @override
  String get city => 'শহর';

  @override
  String get shippingAddress => 'ডেলিভারির ঠিকানা';

  @override
  String get email => 'ইমেইল';

  @override
  String get password => 'পাসওয়ার্ড';

  @override
  String get createAnAccount => 'একটি অ্যাকাউন্ট তৈরি করুন';

  @override
  String get signUpWithEmailPassword =>
      'আপনার ইমেইল এবং পাসওয়ার্ড দিয়ে সাইন আপ করুন';

  @override
  String get signUp => 'সাইন আপ';

  @override
  String get alreadyHaveAnAccount => 'ইতোমধ্যে একটি অ্যাকাউন্ট আছে? ';

  @override
  String get signIn => 'সাইন ইন';

  @override
  String get welcomeBack => 'আপানাকে স্বাগতম';

  @override
  String get signInWithEmailPassword =>
      'আপনার ইমেইল এবং পাসওয়ার্ড দিয়ে সাইন ইন করুন';

  @override
  String get dontHaveAnAccount => 'অ্যাকাউন্ট নেই? ';

  @override
  String get forgotPassword => 'পাসওয়ার্ড ভুলে গেছেন?';

  @override
  String get enterEmail => 'আপনার ইমেইল লিখুন!';

  @override
  String get enterFirstName => 'আপনার প্রথম নাম লিখুন!';

  @override
  String get enterLastName => 'আপনার শেষ নাম লিখুন!';

  @override
  String get enterCity => 'আপনার শহরের নাম লিখুন!';

  @override
  String get verifyYourOtp => 'আপনার ওটিপি যাচাই করুন';

  @override
  String get otpSentToEmail =>
      'আপনার ইমেইল ঠিকানায় ৪ সংখ্যার একটি ওটিপি পাঠানো হয়েছে';

  @override
  String get verify => 'যাচাই করুন';

  @override
  String get resendOtp => 'পুনরায় ওটিপি পাঠান';

  @override
  String get otpExpireMessage => 'এই কোডটির মেয়াদ শেষ হবে ';
}
