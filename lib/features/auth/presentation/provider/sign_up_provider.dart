
import 'package:craftybay/core/service/network_caller/network_caller.dart';
import 'package:flutter/foundation.dart';

import '../../../../app/get_network_caller.dart';
import '../../../../app/urls.dart';
import '../../data/model/signup_params.dart';

class SignUpProvider extends ChangeNotifier {
  bool _signUpInProgress = false;
  bool get signUpInProgress => _signUpInProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> signUp(SignupParams params) async {
    bool isSuccess = false;

    _signUpInProgress = true;
    notifyListeners();

    final NetworkResponse response = await getNetworkCaller().postRequest(
      Urls.singUpUrl,
      body: params.toJson(),
    );

    if (response.isSuccess) {
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
    }

    _signUpInProgress = false;
    notifyListeners();

    return isSuccess;
  }
}
