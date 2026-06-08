import 'package:flutter/material.dart';

import '../features/auth/presentation/screens/splash_screen.dart';
import '../features/cart/presentation/screen/cart_screen.dart';
import '../features/category/presentation/screen/category_screen.dart';
import '../features/common/presentation/screen/main_bottom_nav_screen.dart';
import '../features/home/presentation/screen/home_screen.dart';
import '../features/wish_list/presentation/screen/wish_list_screen.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    Widget widget = SizedBox();

    switch (settings.name) {
      case SplashScreen.name:
        widget = SplashScreen();
        break;

      case MainBottomNavScreen.name:
        widget = MainBottomNavScreen();
        break;
      case HomeScreen.name:
        widget = HomeScreen();
        break;
      case CategoryScreen.name:
        widget = CategoryScreen();
        break;
      case CartScreen.name:
        widget = CartScreen();
        break;
      case WishListScreen.name:
        widget = WishListScreen();
        break;
    }
    return MaterialPageRoute(builder: (ctx) => widget);
  }
}
