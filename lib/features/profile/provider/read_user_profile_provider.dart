import 'package:craftybay/app/get_network_caller.dart';
import 'package:craftybay/app/urls.dart';
import 'package:craftybay/core/service/network_caller/network_caller.dart';
import 'package:craftybay/features/shared/data/model/user_model.dart';
import 'package:flutter/cupertino.dart';

class ReadUserProfileProvider extends ChangeNotifier {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  UserModel? _userData;
  UserModel? get userData => _userData;

  Future<bool> readUserProfile() async {
    bool isSuccess = false;

    _inProgress = true;
    notifyListeners();

    final NetworkResponse response = await getNetworkCaller().getRequest(
      AppUrls.readProfile,
    );

    if (response.isSuccess) {
      UserModel userModel = UserModel.fromJson(response.responseBody!['data']);
      _userData = userModel;
      _errorMessage = null;
      isSuccess = true;
    } else {
      _userData = null;
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    notifyListeners();

    return isSuccess;
  }
}
