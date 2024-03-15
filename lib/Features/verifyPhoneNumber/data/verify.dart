import 'package:Mowater/core/networking/api/api_result.dart';
import 'package:Mowater/core/networking/api/api_service.dart';
import 'package:Mowater/core/services/user_state.dart';

class VerifyCodeRepositeory {
  final ApiService _apiService;

  VerifyCodeRepositeory(this._apiService);

  Future<ApiResult> verify({
    required String phoneNumber,
    required String code,
    required String sendTo,
  }) async {
    print(sendTo == 'Phone Number');
    print(code);
    try {
      print(sendTo);
      final response = await _apiService.verifyCode({
        "columnName":
            sendTo == 'Phone Number' ? 'phone_number' : "whatsappNumber",
        'phone_number': "+971$phoneNumber",
        'verifycode': code
      });
      print('===============');

      print('===============');
      if (response.status == 'success') {
        // return ApiResult.failure(response.message);

        return ApiResult.success(response.user);
      } else {
        return ApiResult.failure(response.message);
      }
    } catch (e) {
      print(e);

      return const ApiResult.failure('Server Error');
    }
  }
}
