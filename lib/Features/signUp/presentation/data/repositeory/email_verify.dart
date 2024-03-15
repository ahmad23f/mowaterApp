import 'package:dio/dio.dart';
import 'package:Mowater/core/networking/api/api_result.dart';
import 'package:Mowater/core/networking/api/api_service.dart';

class VerifyEmailRepositeory {
  final ApiService _apiService;
  VerifyEmailRepositeory(this._apiService);

  Future<ApiResult> verifyEmail(
      {required String email, required String verifyCode}) async {
    try {
      print('=============try===============');

      final respose = await _apiService.verifyEmail(
          FormData.fromMap({"email": email, "verification_code": verifyCode}));

      if (respose.status == 'success') {
        return ApiResult.success(respose.message);
      } else {
        return ApiResult.failure(respose.message);
      }
    } catch (e) {
      return const ApiResult.failure('Server Errorr');
    }
  }

  Future<ApiResult> resednCode(String email) async {
    try {
      final response =
          await _apiService.resednEmailCode(FormData.fromMap({"email": email}));
      if (response.status == 'success') {
        return ApiResult.success(response.message);
      } else {
        return ApiResult.failure(response.message);
      }
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
