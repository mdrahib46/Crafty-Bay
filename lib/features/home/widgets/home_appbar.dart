import 'package:craftybay/app/controller/auth_controller.dart';
import 'package:craftybay/app/crafty_bay_app.dart';
import 'package:craftybay/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:craftybay/features/profile/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../app/asset_path.dart';
import 'circle_icon_button.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: SvgPicture.asset(AssetPath.logoNavSvg),
      actions: [
        CircleIconButton(icon: Icons.person, onTap: _moveToProfileScreen),
        const SizedBox(width: 8),
        CircleIconButton(icon: Icons.call, onTap: () {}),
        const SizedBox(width: 8),
        CircleIconButton(
          icon: Icons.notifications_active_rounded,
          onTap: () {},
        ),
        const SizedBox(width: 16),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(56);

  void _moveToProfileScreen() {
    if (AuthController.accessToken != null) {
      final userModel = AuthController.userModel;
      Navigator.pushNamed(
        CraftyBayApp.navigatorKey.currentContext!,
        ProfileScreen.name,
        arguments: userModel,
      );
    } else {
      Navigator.pushNamed(
        CraftyBayApp.navigatorKey.currentContext!,
        SignInScreen.name,
      );
    }
  }
}
