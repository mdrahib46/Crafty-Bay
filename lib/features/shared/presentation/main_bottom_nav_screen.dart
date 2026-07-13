
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/app_colors.dart';
import '../../cart/presentation/screen/cart_screen.dart';
import '../../category/presentation/screen/category_screen.dart';
import '../../home/presentation/provider/home_carousel_slider_provider.dart';
import '../../home/presentation/screen/home_screen.dart';
import '../../wish_list/presentation/screen/wish_list_screen.dart';
import 'providers/main_nav_holder_provider.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  static const String name = '/bottom-nav-screen';

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {

  final HomeCarouselSliderProvider _carouselSliderProvider = HomeCarouselSliderProvider();

  final List<Widget> _screens = [
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    WishListScreen(),
  ];

  @override
  void initState() {
    _carouselSliderProvider.homeCarouselSlider();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Main Bottom Screen");
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider.value(value: _mainNavHolderProvider),
        ChangeNotifierProvider.value(value: _carouselSliderProvider),
      ],
      child: Consumer<MainNavHolderProvider>(
        builder: (context, navHolderProvider,_) {
          return Scaffold(
            body: _screens[navHolderProvider.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              unselectedItemColor: Colors.grey,
              selectedItemColor: AppColors.themeColor,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              currentIndex: navHolderProvider.currentIndex,
              onTap: navHolderProvider.changeIndex,

              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.category),
                  label: 'Category',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_basket_outlined),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border),
                  label: 'Wish',
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
