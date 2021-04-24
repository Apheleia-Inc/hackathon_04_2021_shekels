import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hackathon_04_2021_shekels/ui/commons/app_appbar.dart';
import 'package:hackathon_04_2021_shekels/ui/commons/app_drawer.dart';

class AppScaffold extends StatefulWidget {
  final String titleText;
  final Widget body;
  final AppAppBarLeadingBtnType leadingBtnType;
  final List<Widget> appBarActions;
  final Widget floatingActionButton;
  final FloatingActionButtonLocation floatingActionButtonLocation;

  const AppScaffold({
    Key key,
    this.titleText,
    @required this.body,
    this.leadingBtnType = AppAppBarLeadingBtnType.back,
    this.appBarActions = const [],
    this.floatingActionButton,
    this.floatingActionButtonLocation,
  }) : super(key: key);

  @override
  _AppScaffoldState createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: AppDrawer(),
        // appBar: AppAppBar(
        //   titleText: widget.titleText,
        //   leadingBtnType: widget.leadingBtnType,
        //   actions: widget.appBarActions,
        // ),
        body: widget.body,
        floatingActionButton: widget.floatingActionButton,
        floatingActionButtonLocation: widget.floatingActionButtonLocation,
      ),
    );
  }
}
