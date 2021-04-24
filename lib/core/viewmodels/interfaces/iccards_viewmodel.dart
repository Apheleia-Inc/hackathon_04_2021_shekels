import 'package:flutter/material.dart';
import 'package:hackathon_04_2021_shekels/core/dtos/linked_card_dto.dart';

abstract class ICCardsViewmodel implements ChangeNotifier {
  List<LinkedCardDto> get linkedCardList;

  Future<LinkedCardDto> addCard({
    @required String cardNumber,
    @required String cardExpiryDate,
    @required String cardHolderName,
    @required String cardCVV,
  });

  Future<void> removeCard(String cardId);
}
