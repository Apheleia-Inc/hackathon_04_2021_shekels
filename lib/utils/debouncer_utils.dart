import 'dart:async';

class Debouncer {
  final int milliseconds;
  Function action;
  Timer _timer;

  Debouncer({this.milliseconds = 500});

  run(Function action) {
    if (_timer != null) {
      _timer.cancel();
    }

    _timer = Timer(
      Duration(milliseconds: milliseconds),
      action,
    );
  }
}
