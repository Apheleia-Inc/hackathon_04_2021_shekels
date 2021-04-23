import 'package:flutter/material.dart';
import 'package:hackathon_04_2021_shekels/utils/theme_color_utils.dart';

enum AppButtonType {
  solid,
  outlined,
}

class AppButton extends StatelessWidget {
  final Function onPressed;
  final double height;
  final Color btnColor;
  final Color textColor;
  final Widget child;
  final AppButtonType type;
  final BorderRadius borderRadius;

  const AppButton({
    Key key,
    @required this.onPressed,
    this.height = 40,
    this.btnColor,
    this.textColor,
    this.child,
    this.type = AppButtonType.solid,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: height,
      child: _buildButton(context),
    );
  }

  Widget _buildButton(BuildContext context) {
    return type == AppButtonType.solid
        ? FlatButton(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onPressed: onPressed,
            color: btnColor ?? Theme.of(context).primaryColor,
            textColor: textColor ?? Colors.white,
            disabledColor: Theme.of(context).disabledColor,
            disabledTextColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(5),
            ),
            child: child,
          )
        : OutlineButton(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onPressed: onPressed,
            color: btnColor ?? Theme.of(context).primaryColor,
            borderSide: BorderSide(
              width: 2,
              color: btnColor ?? Theme.of(context).primaryColor,
            ),
            textColor: textColor ?? Theme.of(context).primaryColor,
            disabledTextColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(5),
            ),
            child: child,
          );
  }
}
