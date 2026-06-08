import 'package:flutter/material.dart';

import '../../../cart/presentation/screen/cart_screen.dart';
import '../../../category/presentation/screen/category_screen.dart';
import '../../../home/presentation/screen/home_screen.dart';
import '../../../wish_list/presentation/screen/wish_list_screen.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  static const String name = '/bottom-nav-screen';

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    WishListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    print("Main Bottom Screen");
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_border),
            label: 'Wish',
          ),
        ],
      ),
    );
  }
}
