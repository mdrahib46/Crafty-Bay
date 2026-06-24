
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../../../app/app_colors.dart';
import '../../../shared/presentation/main_bottom_nav_screen.dart';
import '../provider/otp_timer_provider.dart';
import '../widgets/app_logo.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key});
  static const String name = '/verify-otp';

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  final PinInputController _pinInputController = PinInputController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final OtpTimerProvider _otpTimerProvider = OtpTimerProvider();


  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){
      _otpTimerProvider.startTimer();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                        'Verify Your OTP',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'A 4 digit OTP has been sent to your email address',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      const SizedBox(height: 20),
                      MaterialPinFormField(
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

                      FilledButton(
                        onPressed: _onTapSingIn,
                        child: Text('Verify'),
                      ),
                      const SizedBox(height: 20),
                      Consumer<OtpTimerProvider>(
                        builder: (context, _, _) {

                          if(_otpTimerProvider.secondsLeft == 0){
                            return  TextButton(
                              onPressed: _navigateToSignUpScreen,
                              child: Text('Resend OTP'),
                            );
                          }

                          return RichText(
                            text: TextSpan(
                              text: "This code will be expire in ",
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium!.copyWith(color: Colors.grey),
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
                        }
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
      Navigator.pushNamedAndRemoveUntil(
        context,
        MainBottomNavScreen.name,
        (route) => false,
      );
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
