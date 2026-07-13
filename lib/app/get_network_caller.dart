import 'package:craftybay/app/controller/auth_controller.dart';
import 'package:craftybay/core/service/network_caller/network_caller.dart';

NetworkCaller getNetworkCaller() {
  return NetworkCaller(
    headers: () => {
      'content-type': 'application/json',
      if (AuthController.accessToken != null)
        'token': AuthController.accessToken!,
    },
  );
}
