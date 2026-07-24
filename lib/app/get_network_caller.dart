

import 'package:flutter/cupertino.dart';

import '../core/service/network_caller/network_caller.dart';
import '../features/auth/presentation/screens/sign_in_screen.dart';
import 'controller/auth_controller.dart';
import 'crafty_bay_app.dart';

NetworkCaller getNetworkCaller() {
  return NetworkCaller(
    headers: () => {
      'content-type': 'application/json',
      if (AuthController.accessToken != null)
        'token': AuthController.accessToken!,
    },

    /// On User UnAuthorize
    onUnAuthorized: () async {
      await AuthController.clearUserData();
      Navigator.pushNamed(
        CraftyBayApp.navigatorKey.currentContext!,
        SignInScreen.name,
      );
    },
  );
}
