
import 'package:carousel_slider/carousel_slider.dart';
import 'package:craftybay/features/home/widgets/product_search_bar.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../widgets/home_appbar.dart';
import '../../widgets/home_section_header.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String name = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List _carouselItemList = [1, 2, 3, 4, 5, 6];
  int _currentIndex = 0;

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
                      _currentIndex = index;
                    });
                  },
                ),


              items: _carouselItemList.map((i) {
                return Container(
                  width: double.infinity,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_carouselItemList.length, (int index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 16,
                  width: 16,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index
                        ? AppColors.themeColor
                        : Colors.white,
                    border: BoxBorder.all(
                      color: _currentIndex == index
                          ? AppColors.themeColor
                          : Colors.grey,
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 16),
            HomeSectionHeader(title: 'All Categories', onTap: () {}),
          ],
        ),
      ),
    );
  }

}
