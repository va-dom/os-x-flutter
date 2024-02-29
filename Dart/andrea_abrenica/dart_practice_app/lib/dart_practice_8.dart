import 'dart:async';

printTimeAfterDelay(Duration delay) {
  Future.delayed(delay, () {
    print('Current time after ${delay.inSeconds} seconds: ${DateTime.now()}');
  });
}
