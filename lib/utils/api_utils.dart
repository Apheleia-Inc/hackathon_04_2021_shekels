import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:hackathon_04_2021_shekels/core/app_models/result_app_model.dart';
import 'package:hackathon_04_2021_shekels/core/dtos/error/error_api_dto.dart';

class ApiUtils {
  static Future<ResultAppModel> execApiCall(
    Future<void> Function() apiFunction,
  ) async {
    try {
      await apiFunction();
      return ResultAppModel(
        isSuccess: true,
        errorMessage: '',
      );
    } on DioError catch (e) {
      Logger().e(e);
      try {
        ErrorApiDto errorResponse = ErrorApiDto.fromJson(e.response.data);

        return ResultAppModel(
          isSuccess: false,
          errorMessage: errorResponse.detailMessage ?? 'Something went wrong',
        );
      } catch (e) {
        Logger().e(e);
        return ResultAppModel(
          isSuccess: false,
          errorMessage: 'Something went wrong',
        );
      }
    } catch (e) {
      Logger().e(e);
      return ResultAppModel(
        isSuccess: false,
        errorMessage: 'Something went wrong',
      );
    }
  }
}
