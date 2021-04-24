import 'package:get/get.dart';
import 'package:hackathon_04_2021_shekels/ui/commons/add_credit_card_btm_sheet.dart';
import 'package:hackathon_04_2021_shekels/ui/commons/filter_promotions_btm_sheet.dart';
import 'package:hackathon_04_2021_shekels/ui/commons/promotion_detail_btm_sheet.dart';

class BottomSheetUtils {
  static Future<void> showAddCreditCardBS() async {
    await Get.bottomSheet(
      AddCreditCardBtmSheet(),
      isScrollControlled: true,
    );
  }

  static Future<void> showFilterPromotionsBS() async {
    await Get.bottomSheet(
      FilterPromotionsBtmSheet(),
      isScrollControlled: true,
    );
  }

  static Future<void> showPromotionDetailBS() async {
    await Get.bottomSheet(
      PromotionDetailBtmSheet(),
      isScrollControlled: true,
    );
  }
}
