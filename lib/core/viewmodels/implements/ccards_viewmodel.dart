import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:hackathon_04_2021_shekels/core/dtos/linked_card_dto.dart';
import 'package:hackathon_04_2021_shekels/core/viewmodels/interfaces/iccards_viewmodel.dart';
import 'package:hackathon_04_2021_shekels/utils/credit_card_utils.dart';
import 'package:hackathon_04_2021_shekels/utils/loading_dialog_utils.dart';
import 'package:uuid/uuid.dart';

class CCardsViewmodel extends ChangeNotifier implements ICCardsViewmodel {
  List<LinkedCardDto> _linkedCardList = [];

  @override
  List<LinkedCardDto> get linkedCardList => _linkedCardList;

  @override
  Future<void> addCard({
    @required String cardNumber,
    @required String cardExpiryDate,
    @required String cardHolderName,
    @required String cardCVV,
  }) async {
    CardType cardType = CreditCardUtils.detectCCType(cardNumber);
    await LoadingDialogUtils.showLoading();
    await Future.delayed(
      Duration(
        milliseconds: 2000,
      ),
    );
    _linkedCardList.add(
      LinkedCardDto(
        id: Uuid().v4(),
        linkedDate: DateTime.now(),
        cardType: cardType,
        cardNumber: cardNumber,
        cardExpiryDate: cardExpiryDate,
        cardHolderName: cardHolderName,
        cardCVV: cardCVV,
      ),
    );
    await LoadingDialogUtils.hideLoading();
    notifyListeners();
  }
}
