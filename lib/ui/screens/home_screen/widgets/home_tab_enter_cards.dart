import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hackathon_04_2021_shekels/core/viewmodels/interfaces/iccards_viewmodel.dart';
import 'package:hackathon_04_2021_shekels/utils/bottom_sheet_utils.dart';
import 'package:provider/provider.dart';

class HomeTabEnterCards extends StatefulWidget {
  HomeTabEnterCards({Key key}) : super(key: key);

  @override
  _HomeTabEnterCardsState createState() => _HomeTabEnterCardsState();
}

class _HomeTabEnterCardsState extends State<HomeTabEnterCards> {
  ICCardsViewmodel _viewmodel;

  @override
  void initState() {
    super.initState();

    _viewmodel = context.read<ICCardsViewmodel>();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ICCardsViewmodel>(
      builder: (context, __, ___) {
        return ListView(
          children: [
            ..._viewmodel.linkedCardList.map((linkedCard) {
              return Slidable(
                actionPane: SlidableDrawerActionPane(),
                child: CreditCardWidget(
                  cardNumber: linkedCard.cardNumber,
                  expiryDate: linkedCard.cardExpiryDate,
                  cardHolderName: linkedCard.cardHolderName,
                  cvvCode: linkedCard.cardCVV,
                  showBackView: false,
                ),
                secondaryActions: <Widget>[
                  IconSlideAction(
                    caption: 'Delete',
                    color: Colors.red,
                    icon: Icons.delete,
                    onTap: () {},
                  ),
                ],
              );
            }).toList(),
            SizedBox(height: 15),
            _buildAddButton(),
          ],
        );
      },
    );
  }

  Widget _buildAddButton() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: DottedBorder(
        color: Theme.of(context).primaryColor,
        dashPattern: [4, 4],
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
            height: 150,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(
                    Icons.credit_card,
                    color: Theme.of(context).primaryColor,
                    size: 40,
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

  // Widget _buildCCardInputForm() {
  //   return CreditCardInputForm(
  //     showResetButton: false,

  //     onStateChange: (currentState, cardInfo) {
  //       print(currentState);
  //       print(cardInfo);
  //     },
  //     initialAutoFocus: false,
  //     // cardCVV: '222',
  //     // cardName: 'Jeongtae Kim',
  //     // cardNumber: '1111111111111111',
  //     // cardValid: '12/23',
  //     // intialCardState: InputState.DONE,
  //     frontCardDecoration: _getCardDecoration(),
  //     backCardDecoration: _getCardDecoration(),
  //     nextButtonDecoration: _getButtonDecoration(),
  //     prevButtonDecoration: _getButtonDecoration(),
  //   );
  // }

  BoxDecoration _getCardDecoration() {
    return BoxDecoration(
      boxShadow: <BoxShadow>[
        BoxShadow(color: Colors.black54, blurRadius: 15.0, offset: Offset(0, 8))
      ],
      gradient: LinearGradient(
        colors: [
          Theme.of(context).primaryColor,
          Theme.of(context).primaryColorDark,
        ],
        begin: const FractionalOffset(0.0, 0.0),
        end: const FractionalOffset(1.0, 0.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    );
  }

  BoxDecoration _getButtonDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(30.0),
      gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColorDark,
          ],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp),
    );
  }
}
