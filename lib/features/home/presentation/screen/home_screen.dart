import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../widgets/home_appbar.dart';
import '../../widgets/home_section_header.dart';
import '../../widgets/product_search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String name = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List _carouselItemList = [1, 2, 3, 4, 5, 6];
  ValueNotifier<int> _currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ProductSearchBar(),
            const SizedBox(height: 8),
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
                  // List.generate(_carouselItemList.length, (int index) {
                  //
                  //   return Container(
                  //     margin: const EdgeInsets.symmetric(horizontal: 4),
                  //     height: 10,
                  //     width: 10,
                  //     decoration: BoxDecoration(
                  //       shape: BoxShape.circle,
                  //       color: _currentIndex == index
                  //           ? AppColors.themeColor
                  //           : Colors.white,
                  //       border: BoxBorder.all(
                  //         color: _currentIndex == index
                  //             ? AppColors.themeColor
                  //             : Colors.grey,
                  //       ),
                  //     ),
                  //   );
                  // }),
                );
              },
            ),
            const SizedBox(height: 16),
            HomeSectionHeader(title: 'All Categories', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
