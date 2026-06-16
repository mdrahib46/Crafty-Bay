import 'dart:async';

import 'package:flutter/cupertino.dart';

class OtpTimerProvider extends ChangeNotifier {
  final int _secondsForResendOtp = 30;
  Timer? _timer;

  int _secondsLeft = 0;

  int get secondsLeft => _secondsLeft;

  void startTimer() {
    _timer?.cancel();

    _secondsLeft = _secondsForResendOtp;
    notifyListeners();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsLeft <= 1) {
        _secondsLeft = 0;
        timer.cancel();
      } else {
        _secondsLeft--;
      }

      notifyListeners();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
