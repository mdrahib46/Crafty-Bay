import 'package:carousel_slider/carousel_slider.dart';
import 'package:craftybay/features/home/presentation/provider/home_carousel_slider_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/app_colors.dart';



class HomeCarouselSlider extends StatefulWidget {
  const HomeCarouselSlider({super.key});

  @override
  State<HomeCarouselSlider> createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {

  final List _carouselItemList = [1, 2, 3, 4, 5, 6];
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 180,
            viewportFraction: 1,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex.value = index;
              });
            },
          ),

          items: _carouselItemList.map((i) {
            return Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.themeColor,
              ),
              child: Center(
                child: Text(
                  'Text $i',
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 8),
        ValueListenableBuilder(
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
                          : Colors.grey.shade300,
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }

  Future<void> homeCarouselSlider () async{
    final provider = context.read<HomeCarouselSliderProvider>();

    final bool isSuccess = await provider.homeCarouselSlider();
    if(isSuccess){

    }


  }

}