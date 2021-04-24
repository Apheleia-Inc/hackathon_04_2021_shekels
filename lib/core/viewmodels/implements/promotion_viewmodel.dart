import 'package:flutter/material.dart';
import 'package:hackathon_04_2021_shekels/core/dtos/promotion_dto.dart';
import 'package:hackathon_04_2021_shekels/core/viewmodels/interfaces/ipromotions_viewmodel.dart';
import 'package:hackathon_04_2021_shekels/utils/loading_dialog_utils.dart';

class PromotionsViewmodel extends ChangeNotifier
    implements IPromotionsViewmodel {
  List<PromotionDto> _promotionList = [];

  @override
  List<PromotionDto> get promotionList => _promotionList;

  @override
  Future<void> addPromotions({
    @required List<PromotionDto> promotionList,
  }) async {
    await LoadingDialogUtils.showLoading();
    await Future.delayed(
      Duration(
        milliseconds: 2000,
      ),
    );
    _promotionList.addAll(promotionList);
    await LoadingDialogUtils.hideLoading();
    notifyListeners();
  }
}
