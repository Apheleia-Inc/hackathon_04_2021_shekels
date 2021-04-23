import 'package:flutter/material.dart';

class KeyboardUnfocusWrapper extends StatefulWidget {
  final Widget child;

  const KeyboardUnfocusWrapper({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  _KeyboardUnfocusWrapperState createState() => _KeyboardUnfocusWrapperState();
}

class _KeyboardUnfocusWrapperState extends State<KeyboardUnfocusWrapper> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: this.widget.child,
    );
  }
}
