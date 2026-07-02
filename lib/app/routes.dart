
import 'package:flutter/material.dart';

import '../features/auth/presentation/screens/otp_verify_screen.dart';
import '../features/auth/presentation/screens/sign_in_screen.dart';
import '../features/auth/presentation/screens/sign_up_screen.dart';
import '../features/auth/presentation/screens/splash_screen.dart';
import '../features/cart/presentation/screen/cart_screen.dart';
import '../features/category/presentation/screen/category_screen.dart';
import '../features/product/presentation/screen/product_details_screen.dart';
import '../features/product/presentation/screen/product_list_by_category_screen.dart';
import '../features/shared/presentation/main_bottom_nav_screen.dart';
import '../features/home/presentation/screen/home_screen.dart';
import '../features/wish_list/presentation/screen/wish_list_screen.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    Widget widget = SizedBox();

    switch (settings.name) {
      case SplashScreen.name:
        widget = SplashScreen();
        break;
      case SignUpScreen.name:
        widget = SignUpScreen();
        break;
      case OtpVerifyScreen.name:
        widget = OtpVerifyScreen();
        break;

      case SignInScreen.name:
        widget = SignInScreen();
        break;
      case MainBottomNavScreen.name:
        widget = MainBottomNavScreen();
        break;
      case HomeScreen.name:
        widget = HomeScreen();
        break;
      case ProductDetailsScreen.name:
        String  args = settings.arguments as String;
        widget = ProductDetailsScreen(productId: args);
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
      case ProductListByCategoryScreen.name:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        widget = ProductListByCategoryScreen(
          categoryId: args['categoryId'],
          categoryName: args['categoryName'],
        );
    }
    return MaterialPageRoute(builder: (ctx) => widget);
  }
}
