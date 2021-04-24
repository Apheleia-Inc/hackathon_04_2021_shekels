import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get.dart';
import 'package:hackathon_04_2021_shekels/core/dtos/linked_card_dto.dart';
import 'package:hackathon_04_2021_shekels/core/dtos/promotion_dto.dart';
import 'package:hackathon_04_2021_shekels/core/viewmodels/interfaces/iccards_viewmodel.dart';
import 'package:hackathon_04_2021_shekels/core/viewmodels/interfaces/ipromotions_viewmodel.dart';
import 'package:hackathon_04_2021_shekels/global/mock_data.dart';
import 'package:hackathon_04_2021_shekels/ui/commons/app_bottom_sheet.dart';
import 'package:hackathon_04_2021_shekels/ui/commons/keyboard_unfocus_wrapper.dart';
import 'package:hackathon_04_2021_shekels/utils/credit_card_utils.dart';
import 'package:provider/provider.dart';

class AddCreditCardBtmSheet extends StatefulWidget {
  AddCreditCardBtmSheet({Key key}) : super(key: key);

  @override
  _AddCreditCardBtmSheetState createState() => _AddCreditCardBtmSheetState();
}

class _AddCreditCardBtmSheetState extends State<AddCreditCardBtmSheet> {
  ICCardsViewmodel _ccardsViewmodel;
  IPromotionsViewmodel _promotionsViewmodel;

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _ccardsViewmodel = context.read<ICCardsViewmodel>();
    _promotionsViewmodel = context.read<IPromotionsViewmodel>();
  }

  Future<void> _addCard() async {
    LinkedCardDto addedCard = await _ccardsViewmodel.addCard(
      cardNumber: cardNumber,
      cardExpiryDate: expiryDate,
      cardHolderName: cardHolderName,
      cardCVV: cvvCode,
    );
    CardType cardType = CreditCardUtils.detectCCType(cardNumber);

    if (cardType == CardType.mastercard) {
      List<PromotionDto> promotions = MockData.getMasterCardPromos(addedCard);
      _promotionsViewmodel.addPromotions(promotionList: promotions);
    } else if (cardType == CardType.visa) {
      List<PromotionDto> promotions = MockData.getVisaPromos(addedCard);
      _promotionsViewmodel.addPromotions(promotionList: promotions);
    }

    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardUnfocusWrapper(
      child: AppBottomSheet(
        height: Get.height * 5 / 6,
        title: 'Link a Card',
        body: Column(
          children: <Widget>[
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              obscureCardNumber: false,
              obscureCardCvv: false,
              cardBgColor: Theme.of(context).primaryColorDark,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    CreditCardForm(
                      formKey: formKey,
                      obscureCvv: true,
                      obscureNumber: true,
                      cardNumber: cardNumber,
                      cvvCode: cvvCode,
                      cardHolderName: cardHolderName,
                      expiryDate: expiryDate,
                      themeColor: Colors.blue,
                      cardNumberDecoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Number',
                        hintText: 'XXXX XXXX XXXX XXXX',
                      ),
                      expiryDateDecoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Expired Date',
                        hintText: 'XX/XX',
                      ),
                      cvvCodeDecoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'CVV',
                        hintText: 'XXX',
                      ),
                      cardHolderDecoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Card Holder',
                      ),
                      onCreditCardModelChange: onCreditCardModelChange,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        actions: [
          AppBottomSheetAction(
            btnColor: Colors.white,
            textColor: Theme.of(context).primaryColor,
            onPressed: () {
              Get.back();
            },
            child: Text('Cancel'),
          ),
          AppBottomSheetAction(
            onPressed: () async {
              if (formKey.currentState.validate()) {
                await _addCard();
              } else {
                print('invalid!');
              }
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
