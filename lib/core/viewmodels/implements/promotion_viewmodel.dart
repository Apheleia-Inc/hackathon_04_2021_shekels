import 'package:flutter/material.dart';
import 'package:hackathon_04_2021_shekels/core/dtos/promotion_dto.dart';
import 'package:hackathon_04_2021_shekels/core/viewmodels/interfaces/ipromotions_viewmodel.dart';

class PromotionsViewmodel extends ChangeNotifier
    implements IPromotionsViewmodel {
  List<PromotionDto> _promotionList = [];

  @override
  List<PromotionDto> get promotionList => _promotionList;

  @override
  void addPromotions({
    @required List<PromotionDto> promotionList,
  }) {
    _promotionList.addAll(promotionList);
    notifyListeners();
  }

  @override
  void removePromotionsByCardId(String cardId) {
    _promotionList.removeWhere((promotion) => promotion.fromCard.id == cardId);
    notifyListeners();
  }
}
