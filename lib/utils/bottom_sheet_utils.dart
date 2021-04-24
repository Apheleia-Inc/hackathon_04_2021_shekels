import 'package:get/get.dart';
import 'package:hackathon_04_2021_shekels/ui/commons/app_bottom_sheet.dart';
import 'package:hackathon_04_2021_shekels/ui/commons/add_credit_card_btm_sheet.dart';

class BottomSheetUtils {
  static Future<void> showAddCreditCardBS() async {
    await Get.bottomSheet(
      AddCreditCardBtmSheet(),
      isScrollControlled: true,
    );
  }
}
