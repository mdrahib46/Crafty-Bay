import 'package:craftybay/app/app_colors.dart';
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
            const SizedBox(height: 8),
            HomeSectionHeader(title: 'Popular', onTap: () {}),
            const SizedBox(height: 8),

            Container(
              width: 150,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: [
                  Container(
                    width: 150,
                    height: 80,
                    decoration: BoxDecoration(
                      color: AppColors.themeColor.withAlpha(20),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                    child: Image.asset('assets/images/shoe.png'),
                  ),
                  Text('Title of the Product '),
                  Row(
                    children: [
                      Text('\$ 100'),
                      Wrap(children: [Icon(Icons.star), Text('4.5')]),
                      Container(child: Icon(Icons.favorite_border)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
