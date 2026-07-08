class AppUrls {
  AppUrls._();

  static const String _baseUrl = 'https://ecom-rs8e.onrender.com/api';

  static const  String singUpUrl = "$_baseUrl/auth/signup";
  static const  String otpVerifyUrl = "$_baseUrl/auth/verify-otp";
  static const  String signInUrl = "$_baseUrl/auth/login";

}