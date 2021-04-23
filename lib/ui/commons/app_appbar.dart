import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hackathon_04_2021_shekels/utils/hero_utils.dart';
import 'package:hackathon_04_2021_shekels/utils/navigation_utils.dart';
import 'package:hackathon_04_2021_shekels/utils/theme_color_utils.dart';

enum AppAppBarLeadingBtnType {
  back,
  settings,
}

class AppAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String titleText;
  final AppAppBarLeadingBtnType leadingBtnType;
  final List<Widget> actions;

  AppAppBar({
    Key key,
    this.titleText,
    @required this.leadingBtnType,
    this.actions = const [],
  })  : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: _buildLeadingBtn(context),
      centerTitle: true,
      title: this.titleText != null ? Text(this.titleText) : Text('Home'),
      actions: this.actions,
    );
  }

  Widget _buildLeadingBtn(BuildContext context) {
    switch (this.leadingBtnType) {
      case AppAppBarLeadingBtnType.back:
        return IconButton(
          onPressed: () {
            NavigationUtils.navigateBack();
          },
          icon: Icon(
            Icons.arrow_left,
            color: Colors.white,
            size: 18,
          ),
        );
      case AppAppBarLeadingBtnType.settings:
        return IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: Icon(
            Entypo.menu,
            color: Colors.white,
            size: 18,
          ),
        );
      default:
        return SizedBox();
    }
  }
}
