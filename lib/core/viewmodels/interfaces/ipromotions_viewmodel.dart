import 'package:flutter/material.dart';
import 'package:hackathon_04_2021_shekels/core/dtos/linked_card_dto.dart';
import 'package:hackathon_04_2021_shekels/core/dtos/promotion_dto.dart';

abstract class IPromotionsViewmodel implements ChangeNotifier {
  List<PromotionDto> get promotionList;

  Future<void> addPromotions({
    @required List<PromotionDto> promotionList,
  });
}
