import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hackathon_04_2021_shekels/core/viewmodels/interfaces/iccards_viewmodel.dart';
import 'package:hackathon_04_2021_shekels/core/viewmodels/interfaces/ipromotions_viewmodel.dart';
import 'package:hackathon_04_2021_shekels/ui/commons/link_card_btn.dart';
import 'package:provider/provider.dart';

class HomeTabEnterCards extends StatefulWidget {
  HomeTabEnterCards({Key key}) : super(key: key);

  @override
  _HomeTabEnterCardsState createState() => _HomeTabEnterCardsState();
}

class _HomeTabEnterCardsState extends State<HomeTabEnterCards> {
  ICCardsViewmodel _cardsViewmodel;
  IPromotionsViewmodel _promotionsViewmodel;

  @override
  void initState() {
    super.initState();

    _cardsViewmodel = context.read<ICCardsViewmodel>();
    _promotionsViewmodel = context.read<IPromotionsViewmodel>();
  }

  Future<void> _deleteCard(String cardId) async {
    await _cardsViewmodel.removeCard(cardId);
    _promotionsViewmodel.removePromotionsByCardId(cardId);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ICCardsViewmodel>(
      builder: (context, __, ___) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Page title
            Container(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Text(
                'Your Cards',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                ),
              ),
            ),
            // Cards section
            Expanded(
              child: ListView(
                children: [
                  ..._cardsViewmodel.linkedCardList.map((linkedCard) {
                    return Slidable(
                      key: ValueKey(linkedCard.id),
                      actionPane: SlidableDrawerActionPane(),
                      child: CreditCardWidget(
                        cardNumber: linkedCard.cardNumber,
                        expiryDate: linkedCard.cardExpiryDate,
                        cardHolderName: linkedCard.cardHolderName,
                        cvvCode: linkedCard.cardCVV,
                        showBackView: false,
                        cardBgColor: Theme.of(context).primaryColorDark,
                      ),
                      secondaryActions: <Widget>[
                        IconSlideAction(
                          caption: 'Delete',
                          color: Colors.red,
                          icon: Icons.delete,
                          onTap: () async {
                            await _deleteCard(linkedCard.id);
                          },
                        ),
                      ],
                    );
                  }).toList(),
                  SizedBox(height: 15),
                  LinkCardBtn(),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
