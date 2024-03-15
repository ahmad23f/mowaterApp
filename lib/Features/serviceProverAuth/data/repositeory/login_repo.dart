import 'package:dio/dio.dart';
import 'package:Mowater/core/networking/api/api_result.dart';
import 'package:Mowater/core/networking/api/api_service.dart';

class SignInServiceProviderRepo {
  final ApiService _apiService;

  SignInServiceProviderRepo(this._apiService);
  Future<ApiResult> signIn(
      {required String phoneNumber,
      required String password,
      required String columnName,
      required tableNmae}) async {
    print('pasw : $password');
    print('phone : $phoneNumber');
    try {
      final response =
          await _apiService.signInServiceProvider(FormData.fromMap({
        'phoneNumber': phoneNumber,
        'password': password,
        'table_name': tableNmae,
        'column_name': columnName
      }));
      print('============ respose  = = === ==');

      print(response.message);
      print('============ respose  = = === ==');

      if (response.status == 'success') {
        return ApiResult.success(response);
      } else {
        return ApiResult.failure(response.message);
      }
    } catch (e) {
      return ApiResult.failure('Error Server Error Code : ${e.hashCode}');
    }
  }
}
// 