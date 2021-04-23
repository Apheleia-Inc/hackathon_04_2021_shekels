import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:hackathon_04_2021_shekels/global/app_router.dart';
import 'package:hackathon_04_2021_shekels/ui/commons/custom_network_image.dart';
import 'package:hackathon_04_2021_shekels/utils/enums.dart';
import 'package:hackathon_04_2021_shekels/utils/navigation_utils.dart';
import 'package:hackathon_04_2021_shekels/utils/theme_color_utils.dart';

class AppDrawer extends StatefulWidget {
  AppDrawer({Key key}) : super(key: key);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  List<_AppDrawerAction> _actions = [];

  @override
  void initState() {
    super.initState();
  }

  void _initActions() {
    _actions = [
      _AppDrawerAction(
        text: 'Account',
        iconData: Ionicons.md_person,
        onPressed: () {
          NavigationUtils.navigateBack();
        },
      ),
      _AppDrawerAction(
        text: 'Subscription',
        iconData: Ionicons.md_medal,
        onPressed: () {
          NavigationUtils.navigateBack();
        },
      ),
      _AppDrawerAction(
        text: 'Feedback',
        iconData: Ionicons.md_chatboxes,
        onPressed: () {
          NavigationUtils.navigateBack();
        },
      ),
      _AppDrawerAction(
        text: 'Contact Us',
        iconData: Ionicons.md_call,
        onPressed: () {
          NavigationUtils.navigateBack();
        },
      ),
    ];
  }

  Widget _buildUserInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1000),
            border: Border.all(
              width: 2,
              color: Colors.white,
            ),
          ),
          child: Hero(
            tag: 'user-avatar',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(1000),
              child: CustomNetworkImage(
                imageUrl:
                    'https://thailamlandscape.vn/wp-content/uploads/2017/10/no-image.png',
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          'email@gmail.com',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        SizedBox(height: 3),
        Text(
          'Hello world',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    _initActions();

    return Drawer(
      child: Container(
        child: ListView(
          padding: EdgeInsets.all(0),
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment(-0.8, 0),
                  colors: [
                    Theme.of(context).primaryColorLight,
                    Theme.of(context).primaryColor,
                  ],
                  radius: 1,
                ),
              ),
              child: _buildUserInfo(),
            ),
            ..._actions.map(
              (action) => ListTile(
                onTap: action.onPressed,
                leading: Icon(action.iconData),
                title: Text(action.text),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AppDrawerAction {
  final Function onPressed;
  final IconData iconData;
  final String text;

  const _AppDrawerAction({
    @required this.onPressed,
    @required this.iconData,
    @required this.text,
  });
}
