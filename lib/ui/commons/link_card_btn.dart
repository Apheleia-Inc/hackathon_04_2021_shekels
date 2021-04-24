import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hackathon_04_2021_shekels/utils/bottom_sheet_utils.dart';

class LinkCardBtn extends StatefulWidget {
  LinkCardBtn({Key key}) : super(key: key);

  @override
  _LinkCardBtnState createState() => _LinkCardBtnState();
}

class _LinkCardBtnState extends State<LinkCardBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: DottedBorder(
        color: Theme.of(context).primaryColor,
        dashPattern: [6, 6],
        strokeWidth: 2,
        padding: EdgeInsets.zero,
        borderType: BorderType.RRect,
        radius: Radius.circular(5),
        child: InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: () {
            BottomSheetUtils.showAddCreditCardBS();
          },
          child: Ink(
            height: 185,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(
                    MaterialCommunityIcons.credit_card_plus_outline,
                    color: Theme.of(context).primaryColor,
                    size: 70,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Link a Card',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
