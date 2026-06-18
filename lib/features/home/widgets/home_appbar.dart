import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../app/asset_path.dart';
import 'circle_icon_button.dart';


class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: SvgPicture.asset(AssetPath.logoNavSvg),
      actions: [
        CircleIconButton(
          icon: Icons.person,
          onTap: () {},
        ),
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
}