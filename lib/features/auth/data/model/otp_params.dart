class OtpParams {
  final String email, otp;

  OtpParams(this.email, this.otp);

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "otp": otp, // static 1234
    };
  }
}
