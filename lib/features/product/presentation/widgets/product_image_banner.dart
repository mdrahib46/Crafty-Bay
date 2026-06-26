import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';


class ProductImageBanner extends StatelessWidget {
  const ProductImageBanner({
    super.key,
    required List<dynamic> carouselItemList,
    required ValueNotifier<int> currentIndex,
  }) : _carouselItemList = carouselItemList, _currentIndex = currentIndex;

  final List<dynamic> _carouselItemList;
  final ValueNotifier<int> _currentIndex;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          items: _carouselItemList.map((i) {
            return Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.grey.shade200),
              child: Center(
                child: Text(
                  'Text $i',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.themeColor,
                  ),
                ),
              ),
            );
          }).toList(),
          options: CarouselOptions(
            height: 220,
            viewportFraction: 1,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              _currentIndex.value = index;
            },
          ),
        ),
        Positioned(
          bottom: 10,
          right: 0,
          left: 0,
          child: ValueListenableBuilder(
            valueListenable: _currentIndex,
            builder: (context, index, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < _carouselItemList.length; i++)
                    Container(
                      height: 12,
                      width: 12,
                      margin: EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: i == index
                            ? AppColors.themeColor
                            : Colors.white,
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}