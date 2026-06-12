import 'package:carousel_slider/carousel_slider.dart';
import 'package:craftybay/app/app_colors.dart';
import 'package:craftybay/app/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


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
      appBar: AppBar(
        title: SvgPicture.asset(AssetPath.logoNavSvg),
        actions: [
          _buildHomeAppBarActionButton(
            icon: Icons.person_outline,
            onTap: () {},
          ),
          const SizedBox(width: 8),
          _buildHomeAppBarActionButton(icon: Icons.call_outlined, onTap: () {}),
          const SizedBox(width: 8),
          _buildHomeAppBarActionButton(
            icon: Icons.notifications_active_outlined,
            onTap: () {},
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.grey.shade300,
                filled: true,
                border: OutlineInputBorder(borderSide: BorderSide.none),
                prefixIcon: Icon(Icons.search),
                hintText: "Search",
              ),
            ),
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

  Widget _buildHomeAppBarActionButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return CircleAvatar(
      backgroundColor: Colors.blueGrey.shade100,
      child: IconButton(
        onPressed: onTap,
        icon: Icon(icon, color: Colors.grey.shade700),
      ),
    );
  }
}

class HomeSectionHeader extends StatelessWidget {
  const HomeSectionHeader({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
        const Spacer(),
        TextButton(
          onPressed: onTap,
          child: Text('See All', style: TextStyle(color: AppColors.themeColor)),
        ),
      ],
    );
  }
}
