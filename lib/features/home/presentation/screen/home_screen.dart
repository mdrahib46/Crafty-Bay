import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/providers/main_nav_holder_provider.dart';
import '../../../shared/widgets/product_card.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ProductSearchBar(),
              const SizedBox(height: 8),
              HomeCarouselSlider(),
              const SizedBox(height: 16),
              HomeSectionHeader(title: 'All Categories', onTap: () {
                context.read<MainNavHolderProvider>().navigateToCategory();
              }),
              const SizedBox(height: 8),
              HomeCategorySection(),
              const SizedBox(height: 8),
              HomeSectionHeader(title: 'Popular', onTap: () {
              }),
              const SizedBox(height: 8),
              SingleChildScrollView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [1, 2, 3, 4, 5].map((e) => ProductCard()).toList(),
                ),
              ),

              // ProductCard(),
            ],
          ),
        ),
      ),
    );
  }
}
