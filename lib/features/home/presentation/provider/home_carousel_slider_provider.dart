
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

  final List<HomeCarouselSliderModel> _homeSlider = [];
  List<HomeCarouselSliderModel> get homeSlider => _homeSlider;

  Future<bool> homeCarouselSlider() async {
    bool isSuccess = false;
    _sliderInProgress = true;
    notifyListeners();

    final NetworkResponse response = await getNetworkCaller().getRequest(
      AppUrls.homeCarouselSlides,
    );

    if (response.isSuccess) {

      List<HomeCarouselSliderModel> sliders = [];

      for(Map<String, dynamic> slider in response.responseBody!['data']['result']){
        sliders.add(HomeCarouselSliderModel.fromJson(slider));
      }

      // TODO:- Implement sliders in Home Screen

      isSuccess = true;
      _errorMessage = null;
    } else {
      isSuccess = false;
      _errorMessage = response.errorMessage!;
    }

    _sliderInProgress = false;
    notifyListeners();

    return isSuccess;
  }
}
