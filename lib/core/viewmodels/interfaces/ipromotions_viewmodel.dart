import 'package:flutter/material.dart';
import 'package:hackathon_04_2021_shekels/core/dtos/promotion_dto.dart';

abstract class IPromotionsViewmodel implements ChangeNotifier {
  List<PromotionDto> get promotionList;

  void addPromotions({
    @required List<PromotionDto> promotionList,
  });

  void removePromotionsByCardId(String cardId);
}
