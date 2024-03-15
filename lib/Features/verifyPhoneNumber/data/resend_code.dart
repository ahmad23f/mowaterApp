import 'package:dio/dio.dart';
import 'package:Mowater/core/networking/api/api_result.dart';
import 'package:Mowater/core/networking/api/api_service.dart';

class ResendOTPRepositeory {
  final ApiService _apiService;

  ResendOTPRepositeory(this._apiService);

  Future<ApiResult> resendOtp(
      {required String token,
      required String fromTable,
      required String sendTo}) async {
    try {
      print('try');
      print(token);
      print(sendTo);
      print('try');

      final response = await _apiService.resendOTP(FormData.fromMap({
        'user_token': token,
        'table_name': fromTable,
        'send_to': sendTo,
      }));
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
