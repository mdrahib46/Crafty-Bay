import 'package:flutter/material.dart';

import '../../../../app/controller/auth_controller.dart';
import '../../../../app/get_network_caller.dart';
import '../../../../app/urls.dart';
import '../../../../core/service/network_caller/network_caller.dart';
import '../../../shared/data/model/user_model.dart';
import '../../data/model/otp_params.dart';

class OtpVerificationProvider extends ChangeNotifier {
  bool _otpVerifyInProgress = false;

  bool get otpVerifyInProgress => _otpVerifyInProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> otpVerification(OtpParams params) async {
    bool isSuccess = false;

    _otpVerifyInProgress = true;
    notifyListeners();

    final NetworkResponse response = await getNetworkCaller().postRequest(
      Urls.otpVerifyUrl,
      body: params.toJson(),
    );
    if (response.isSuccess) {
      /// Save user data and access token from response
      UserModel userModel = UserModel.fromJson(
        response.responseBody!['data']['user'],
      );
      String accessToken = response.responseBody!['data']['token'];
      await AuthController.saveUserData(accessToken, userModel);

      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
    }

    _otpVerifyInProgress = false;
    notifyListeners();

    return isSuccess;
  }
}
