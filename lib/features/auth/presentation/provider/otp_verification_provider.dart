
import 'package:flutter/material.dart';

import '../../../../app/get_network_caller.dart';
import '../../../../app/urls.dart';
import '../../../../core/service/network_caller/network_caller.dart';
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
