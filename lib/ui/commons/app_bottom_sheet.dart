import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathon_04_2021_shekels/ui/commons/app_button.dart';

class AppBottomSheet extends StatelessWidget {
  final double height;
  final String title;
  final Widget body;
  final List<AppBottomSheetAction> actions;

  const AppBottomSheet({
    Key key,
    this.height = 300,
    this.title,
    @required this.body,
    this.actions = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      this.title ?? '',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.close,
                            size: 20,
                            color: Colors.grey[800],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: this.body,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 45,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.grey,
                    width: 2,
                  ),
                ),
              ),
              child: Row(
                children: [
                  ..._buildActions(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildActions() {
    List<Widget> resultActions = [];
    for (int i = 0; i < this.actions.length; i++) {
      final action = this.actions[i];
      bool isLastItem = i == this.actions.length - 1;

      resultActions.add(
        Expanded(
          child: AppButton(
            onPressed: action.onPressed,
            btnColor: action.btnColor,
            textColor: action.textColor,
            child: action.child,
          ),
        ),
      );

      if (!isLastItem) {
        // Add divider (gap) between actions
        resultActions.add(SizedBox(width: 15));
      }
    }

    return resultActions;
  }
}

class AppBottomSheetAction {
  final Function() onPressed;
  final Widget child;
  final Color btnColor;
  final Color textColor;

  AppBottomSheetAction({
    @required this.onPressed,
    @required this.child,
    this.btnColor,
    this.textColor,
  });
}
