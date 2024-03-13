import 'package:dio/dio.dart';
import 'package:mowaterApp/core/networking/api/api_result.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';

class ResetPasswordRepositeory {
  final ApiService _apiService;
  ResetPasswordRepositeory(this._apiService);

  Future<ApiResult> resetPassword(String email) async {
    try {
      final response = await _apiService
          .forgetPassword(FormData.fromMap(({'email': email})));
      if (response.status == 'success') {
        return ApiResult.success(response);
      } else {
        return ApiResult.failure(response.message);
      }
    } catch (e) {
      return const ApiResult.failure("Server Erorr Well Fix It Soon!");
    }
  }

  Future<ApiResult> verifyCode(
      {required String email, required String code}) async {
    print('===========');

    print(email);
    print(code);
    print('===========');

    try {
      final response = await _apiService.verifyResetEmailCode(
          FormData.fromMap(({'email': email, "reset_code": code})));
      print('===========');
      print(response.status);

      print(response.message);
      print('===========');

      if (response.status == 'success') {
        return ApiResult.success(response);
      } else {
        return ApiResult.failure(response.message);
      }
    } catch (e) {
      return const ApiResult.failure("Server Erorr Well Fix It Soon!");
    }
  }
}
