import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:hackathon_04_2021_shekels/core/app_models/result_app_model.dart';
import 'package:hackathon_04_2021_shekels/ui/commons/app_message_dialog.dart';

class DialogUtils {
  static Future<void> showMessageDialog({
    @required AppMessageDialogType type,
    @required String messageText,
  }) async {
    await Get.dialog(
      AppMessageDialog(type: type, messageText: messageText),
    );
  }

  static Future<void> showErrorMessage(ResultAppModel result) async {
    if (result.isSuccess) {
      Logger().e('isSuccess is true');
      return;
    }

    if (result.errorMessage == null) {
      Logger().e('errorMessage is null');
      return;
    }

    await showMessageDialog(
      type: AppMessageDialogType.error,
      messageText: result.errorMessage,
    );
  }
}
