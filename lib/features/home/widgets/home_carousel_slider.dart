
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:provider/provider.dart';

import '../../../app/app_colors.dart';
import '../../shared/widgets/app_network_image.dart';
import '../../shared/widgets/center_circular_progress_indicator.dart';
import '../presentation/provider/home_carousel_slider_provider.dart';

class HomeCarouselSlider extends StatefulWidget {
  const HomeCarouselSlider({super.key});

  @override
  State<HomeCarouselSlider> createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);

  final Set<String> _checkedUrls = {};

  Future<void> _checkImageCache(String url) async {

    if (_checkedUrls.contains(url)) return;
    _checkedUrls.add(url);

    final file = await DefaultCacheManager().getFileFromCache(url);

    if (file != null) {
      debugPrint('✅ CACHE HIT');
      debugPrint('URL: $url');
      debugPrint('PATH: ${file.file.path}');
    } else {
      debugPrint('🌐 CACHE MISS');
      debugPrint('URL: $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeCarouselSliderProvider>(
      builder: (context, carouselProvider, child) {
        if (carouselProvider.sliderInProgress) {
          return const SizedBox(
            height: 180,
            child: CenterCircularProgressIndicator(),
          );
        }

        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 180,
                viewportFraction: 1,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  _currentIndex.value = index;
                },
              ),
              items: carouselProvider.homeSlider.map((slide) {
                _checkImageCache(slide.photoUrl!);

                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: AppNetworkImage(
                    url: slide.photoUrl!,
                  ),
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
      },
    );
  }
}