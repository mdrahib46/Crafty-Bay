import 'package:craftybay/app/controller/auth_controller.dart';
import 'package:craftybay/app/get_network_caller.dart';
import 'package:craftybay/app/urls.dart';
import 'package:craftybay/core/service/network_caller/network_caller.dart';
import 'package:craftybay/features/auth/data/model/sign_in_params.dart';
import 'package:craftybay/features/shared/data/model/user_model.dart';
import 'package:flutter/cupertino.dart';

class SignInProvider extends ChangeNotifier {
  bool _signInInProgress = false;
  bool get signInInProgress => _signInInProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> signIn(SignInParams params) async {
    bool isSuccess = false;

    _signInInProgress = true;
    notifyListeners();

    NetworkResponse response = await getNetworkCaller().postRequest(
      AppUrls.signInUrl,
      body: params.toJson(),
    );

    if (response.isSuccess) {
      UserModel userModel = UserModel.fromJson(
        response.responseBody!['data']['user'],
      );
      String accessToken = response.responseBody!['data']['token'];

      await AuthController.saveUserData(accessToken, userModel);

      isSuccess = true;
      _errorMessage = null;
    } else {
      isSuccess = false;
      _errorMessage = response.errorMessage;
    }

    _signInInProgress = false;
    notifyListeners();

    return isSuccess;
  }
}
