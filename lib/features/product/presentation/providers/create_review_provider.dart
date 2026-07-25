

import 'package:flutter/material.dart';

import '../../../../app/get_network_caller.dart';
import '../../../../app/urls.dart';
import '../../../../core/service/network_caller/network_caller.dart';
import '../../data/models/create_review_params.dart';

class CreateReviewProvider extends ChangeNotifier {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  String? _successMsg;
  String? get successMsg => _successMsg;

  Future<bool> createReview(CreateReviewParams params) async {
    bool isSuccess = false;

    final requestBody = CreateReviewParams(params.id, params.ratings, params.comments);

    _inProgress = true;
    notifyListeners();

    final NetworkResponse response = await getNetworkCaller().postRequest(
      AppUrls.createReview,
      body: requestBody.toJson()
    );
    if (response.isSuccess) {
      isSuccess = true;
      _successMsg = response.responseBody['msg'];
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    notifyListeners();

    return isSuccess;
  }
}
