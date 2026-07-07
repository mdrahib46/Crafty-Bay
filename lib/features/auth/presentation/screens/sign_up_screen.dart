import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/extensions/localization_extension.dart';
import '../../../shared/utils/validators.dart';
import '../../../shared/widgets/show_snackbar_message.dart';
import '../../data/model/signup_params.dart';
import '../provider/sign_up_provider.dart';
import '../widgets/app_logo.dart';
import 'otp_verify_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _enableButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
              onChanged: _checkIfFormValid,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    AppLogo(),
                    Text(
                      'Create An Account',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Sign up with your email and password',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _emailTEController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: context.localization.email,
                      ),
                      validator: (String? input) => Validators.validateInput(
                        input,
                        'Enter you first name !',
                      ),
                    ),
                    const SizedBox(height: 8),

                    TextFormField(
                      controller: _firstNameController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: context.localization.firstName,
                      ),
                      validator: (String? input) => Validators.validateInput(
                        input,
                        'Enter you first name !',
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _lastNameController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: context.localization.lastName,
                      ),
                      validator: (String? input) => Validators.validateInput(
                        input,
                        'Enter your last name !',
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _mobileController,
                      textInputAction: TextInputAction.next,

                      decoration: InputDecoration(
                        hintText: context.localization.mobile,
                      ),
                      validator: (String? input) =>
                          Validators.validateMobile(input),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _cityTEController,
                      textInputAction: TextInputAction.next,

                      decoration: InputDecoration(
                        hintText: context.localization.city,
                      ),
                      validator: (String? input) =>
                          Validators.validateInput(input, 'Enter your city !'),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _passwordTEController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: context.localization.password,
                      ),
                      validator: (String? input) =>
                          Validators.validatePassword(input),
                    ),
                    const SizedBox(height: 20),

                    Consumer<SignUpProvider>(
                      builder: (context, signupProvider, child) {
                        if (signupProvider.signUpInProgress) {
                          return CircularProgressIndicator();
                        } else {
                          return FilledButton(
                            onPressed: _enableButton ? _onTapSingUp : null,
                            child: const Text('Sign Up'),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    RichText(
                      text: TextSpan(
                        text: "Already have an account? ",
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium!.copyWith(color: Colors.grey),
                        children: [
                          TextSpan(
                            text: 'Sign In',
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(
                                  color: AppColors.themeColor,
                                  fontWeight: FontWeight.w500,
                                ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = _navigateToSignInScreen,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSingUp() {
    if (_formKey.currentState!.validate()) {
      _signUP();
    }
  }

  Future<void> _signUP() async {
    final provider = context.read<SignUpProvider>();

    SignupParams signupParams = SignupParams(
      email: _emailTEController.text.trim(),
      firstName: _firstNameController.text.trim(),
      lastName: _lastNameController.text.trim(),
      city: _cityTEController.text.trim(),
      phone: _mobileController.text.trim(),
      password: _passwordTEController.text,
    );

    final bool isSuccess = await provider.signUp(signupParams);

    if (isSuccess) {
      if (mounted) {
        Navigator.pushNamed(context, OtpVerifyScreen.name);
      }
    } else {
      if (mounted) {
        showSnackBarMessage(context, provider.errorMessage!);
      }
    }
  }

  void _checkIfFormValid() {
    if (_formKey.currentState!.validate()) {
      _enableButton = true;
    } else {
      _enableButton = false;
    }
    setState(() {});
  }

  void _navigateToSignInScreen() {}

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _mobileController.dispose();
    _cityTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
