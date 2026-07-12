import 'package:carousel_slider/carousel_slider.dart';
import 'package:craftybay/features/home/presentation/provider/home_carousel_slider_provider.dart';
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
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getHomeCarouselSlider();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeCarouselSliderProvider>();

    if (provider.sliderInProgress) {
      return const SizedBox(
        height: 180,
        child: CenterCircularProgressIndicator(),
      );
    }

    if(provider.homeSlider.isEmpty){
      return const SizedBox(height: 180, child: Center(child: Text('No promotional product found....!'),),);
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

          items: provider.homeSlider.map((slide) {
            return Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.themeColor,
                image: DecorationImage(
                  image: NetworkImage(slide.photoUrl ?? ''),
                  fit: BoxFit.cover,
                ),
              ),
              // child: Center(
              //   child: Text(
              //     'Text ${slide.description}',
              //     style: const TextStyle(fontSize: 16, color: Colors.white),
              //   ),
              // ),
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
                provider.homeSlider.length,
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

  Future<void> _getHomeCarouselSlider() async {
    final provider = context.read<HomeCarouselSliderProvider>();

    final bool isSuccess = await provider.homeCarouselSlider();

    if (!mounted) return;
    if (!isSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(provider.errorMessage ?? "Something went wrong...!"),
        ),
      );
    }
  }
}
