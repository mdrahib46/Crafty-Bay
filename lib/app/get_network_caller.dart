import 'package:craftybay/core/service/network_caller/network_caller.dart';

NetworkCaller getNetworkCaller() {
  return NetworkCaller(
    headers: ()=> {
      'content-type': 'application/json',
      // 'access-token' : 'token'
    },
  );
}
