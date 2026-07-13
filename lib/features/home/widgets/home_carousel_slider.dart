import 'package:carousel_slider/carousel_slider.dart';
import 'package:craftybay/features/home/presentation/provider/home_carousel_slider_provider.dart';
import 'package:craftybay/features/shared/widgets/app_network_image.dart';
import 'package:craftybay/features/shared/widgets/center_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/app_colors.dart';

class HomeCarouselSlider extends StatefulWidget {
  const HomeCarouselSlider({super.key});

  @override
  State<HomeCarouselSlider> createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);



  @override
  Widget build(BuildContext context) {
    return Consumer<HomeCarouselSliderProvider>(
      builder: (context, carouselProvider, child) {

        print(carouselProvider.homeSlider.length);

        if(carouselProvider.sliderInProgress){
          return SizedBox(
              height: 180,
              child: CenterCircularProgressIndicator());
        }

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

              items: carouselProvider.homeSlider.map((slide) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(8),
                  //   color: AppColors.themeColor,
                  //   image: DecorationImage(
                  //     image: NetworkImage(slide.photoUrl ?? ''),
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),
                  
                  child: AppNetworkImage(url: slide.photoUrl!),
                );
              }).toList(),
            ),

            const SizedBox(height: 8),

            ValueListenableBuilder<int>(
              valueListenable: _currentIndex,
              builder: (context, currentIndex, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    carouselProvider.homeSlider.length,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentIndex == index
                            ? AppColors.themeColor
                            : Colors.grey.shade300,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        );
      }
    );
  }

  // Future<void> _getHomeCarouselSlider() async {
  //   final provider = context.read<HomeCarouselSliderProvider>();
  //
  //   final bool isSuccess = await provider.homeCarouselSlider();
  //
  //   if (!mounted) return;
  //   if (!isSuccess) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text(provider.errorMessage ?? "Something went wrong...!"),
  //       ),
  //     );
  //   }
  // }
}
