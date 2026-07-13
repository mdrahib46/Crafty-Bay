import 'package:flutter/material.dart';

import '../../../../app/get_network_caller.dart';
import '../../../../app/urls.dart';
import '../../../../core/service/network_caller/network_caller.dart';
import '../../data/model/home_carousel_sliderModel.dart';

class HomeCarouselSliderProvider extends ChangeNotifier {
  bool _sliderInProgress = false;

  bool get sliderInProgress => _sliderInProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  List<HomeCarouselSliderModel> _homeSlider = [];
  List<HomeCarouselSliderModel> get homeSlider => _homeSlider;

  Future<bool> homeCarouselSlider() async {
    bool isSuccess = false;

    _sliderInProgress = true;
    notifyListeners();

    final NetworkResponse response = await getNetworkCaller().getRequest(
      AppUrls.homeCarouselSlides,
    );
    if (response.isSuccess) {
      List<HomeCarouselSliderModel> sliderModel = [];

      for (Map<String, dynamic> model
          in response.responseBody['data']['results']) {
        sliderModel.add(HomeCarouselSliderModel.fromJson(model));
      }
      _homeSlider = sliderModel;
      isSuccess = true;
      _errorMessage = null;
    } else {
      isSuccess = false;
      _errorMessage = response.errorMessage;
    }

    _sliderInProgress = false;
    notifyListeners();

    return isSuccess;
  }
}
