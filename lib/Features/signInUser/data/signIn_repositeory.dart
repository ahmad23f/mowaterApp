import 'package:dio/dio.dart';
import 'package:mowaterApp/core/networking/api/api_result.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';

class SignInUserRepositeory {
  final ApiService _apiService;
  SignInUserRepositeory(
    this._apiService,
  );

  Future<ApiResult> signIn(
      {required String email, required String password}) async {
    try {
      final response = await _apiService
          .signInUser(FormData.fromMap({'email': email, 'password': password}));

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
