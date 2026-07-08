import 'package:craftybay/app/extensions/localization_extension.dart';
import 'package:craftybay/features/auth/data/model/otp_params.dart';
import 'package:craftybay/features/auth/presentation/provider/otp_verification_provider.dart';
import 'package:craftybay/features/shared/widgets/show_snackbar_message.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../../../app/app_colors.dart';
import '../../../shared/presentation/main_bottom_nav_screen.dart';
import '../provider/otp_timer_provider.dart';
import '../widgets/app_logo.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key, required this.email});

  static const String name = '/verify-otp';

  final String email;

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  final PinInputController _pinInputController = PinInputController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final OtpTimerProvider _otpTimerProvider = OtpTimerProvider();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _otpTimerProvider.startTimer();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final localization = context.localization;
    return ChangeNotifierProvider.value(
      value: _otpTimerProvider,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 80),
                      AppLogo(),
                      Text(
                        localization.verifyYourOtp,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        localization.otpSentToEmail,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      const SizedBox(height: 20),
                      MaterialPinFormField(
                        pinController: _pinInputController,
                        length: 4,
                        keyboardType: TextInputType.number,
                        theme: MaterialPinTheme(
                          fillColor: Colors.transparent,
                          borderColor: AppColors.themeColor,
                          focusedFillColor: AppColors.themeColor.withValues(
                            alpha: 0.10,
                          ),
                          borderWidth: 2,
                          focusedBorderColor: AppColors.themeColor,
                          filledFillColor: AppColors.themeColor.withValues(
                            alpha: 0.10,
                          ),
                          filledBorderColor: AppColors.themeColor,
                          textStyle: const TextStyle(
                            color: AppColors.themeColor,
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                      const SizedBox(height: 8),

                      Consumer<OtpVerificationProvider>(
                        builder: (context, otpProvider, child) {
                          if (otpProvider.otpVerifyInProgress) {
                            return Center(child: CircularProgressIndicator());
                          } else {
                            return FilledButton(
                              onPressed: _onTapSingIn,
                              child: Text(localization.verify),
                            );
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      Consumer<OtpTimerProvider>(
                        builder: (context, _, _) {
                          if (_otpTimerProvider.secondsLeft == 0) {
                            return TextButton(
                              onPressed: _navigateToSignUpScreen,
                              child: Text(localization.resendOtp),
                            );
                          }

                          return RichText(
                            text: TextSpan(
                              text: localization.otpExpireMessage,
                              style: Theme.of(context).textTheme.bodyMedium!
                                  .copyWith(color: Colors.grey),
                              children: [
                                TextSpan(
                                  text: '${_otpTimerProvider.secondsLeft}s',
                                  style: Theme.of(context).textTheme.bodyMedium!
                                      .copyWith(
                                        color: AppColors.themeColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSingIn() {
    if (_formKey.currentState!.validate()) {
      _otpVerification();
    }
  }

  Future<void> _otpVerification() async {
    final provider = context.read<OtpVerificationProvider>();

    OtpParams params = OtpParams(widget.email, _pinInputController.text);

    final bool isSuccess = await provider.otpVerification(params);

    if (isSuccess) {
      if (mounted) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          MainBottomNavScreen.name,
          (route) => false,
        );
      }
    } else {
      if (mounted) {
        showSnackBarMessage(context, provider.errorMessage!, isError: true);
      }
    }
  }

  void _navigateToSignUpScreen() {
    _otpTimerProvider.startTimer();
  }

  @override
  void dispose() {
    _pinInputController.dispose();
    super.dispose();
  }
}
