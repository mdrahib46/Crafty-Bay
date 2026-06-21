import 'package:flutter/material.dart';

import '../../widgets/home_appbar.dart';
import '../../widgets/home_carousel_slider.dart';
import '../../widgets/home_category_section.dart';
import '../../widgets/home_section_header.dart';
import '../../widgets/product_search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String name = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            HomeCarouselSlider(),
            const SizedBox(height: 16),
            HomeSectionHeader(title: 'All Categories', onTap: () {}),
            const SizedBox(height: 8),
            HomeCategorySection(),
          ],
        ),
      ),
    );
  }
}
