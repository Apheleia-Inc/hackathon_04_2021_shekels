import 'package:flutter/material.dart';
import 'package:hackathon_04_2021_shekels/ui/commons/app_appbar.dart';
import 'package:hackathon_04_2021_shekels/ui/commons/app_scaffold.dart';
import 'package:hackathon_04_2021_shekels/ui/commons/keyboard_unfocus_wrapper.dart';
import 'package:hackathon_04_2021_shekels/ui/screens/home_screen/widgets/home_tab_enter_cards.dart';
import 'package:hackathon_04_2021_shekels/ui/screens/home_screen/widgets/home_tab_promotions.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return KeyboardUnfocusWrapper(
      child: AppScaffold(
        leadingBtnType: AppAppBarLeadingBtnType.settings,
        titleText: 'Home',
        body: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          confineInSafeArea: true,
          backgroundColor: Colors.white, // Default is Colors.white.
          handleAndroidBackButtonPress: true, // Default is true.
          resizeToAvoidBottomInset:
              true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
          stateManagement: true, // Default is true.
          hideNavigationBarWhenKeyboardShows:
              true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(10.0),
            colorBehindNavBar: Colors.white,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: ItemAnimationProperties(
            // Navigation Bar's items animation properties.
            duration: Duration(milliseconds: 350),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: ScreenTransitionAnimation(
            // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 350),
          ),
          navBarStyle: NavBarStyle.style7,
        ),
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [
      HomeTabPromotions(),
      HomeTabEnterCards(),
      Text('Hello'),
      Text('Hi'),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: ("Home"),
        activeColorPrimary: Theme.of(context).primaryColor,
        activeColorSecondary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.credit_card),
        title: ("Cards"),
        activeColorPrimary: Theme.of(context).primaryColor,
        activeColorSecondary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.favorite),
        title: ("Favorite"),
        activeColorPrimary: Theme.of(context).primaryColor,
        activeColorSecondary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings),
        title: ("Settings"),
        activeColorPrimary: Theme.of(context).primaryColor,
        activeColorSecondary: Colors.white,
      ),
    ];
  }
}
