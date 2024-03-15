import 'package:dio/dio.dart';
import 'package:Mowater/core/networking/api/api_result.dart';
import 'package:Mowater/core/networking/api/api_service.dart';

class SignInRepositeory {
  final ApiService _apiService;
  SignInRepositeory(
    this._apiService,
  );

  Future<ApiResult> signIn(
      {required String contact,
      required String password,
      required String userType,
      required String loginType}) async {
    try {
      final response = await _apiService.signIn(FormData.fromMap({
        'contact': contact,
        'password': password,
        'login_type': loginType,
        'type': userType
      }));

      print(response);
      if (response.status == 'success') {
        return ApiResult.success(response);
      } else {
        return ApiResult.failure(response.message);
      }
    } catch (e) {
      return ApiResult.success(e);
    }
  }
}
