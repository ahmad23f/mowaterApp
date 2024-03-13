import 'package:mowaterApp/Features/signUp/data/models/sign_up_request.dart';
import 'package:mowaterApp/Features/signUp/data/models/user_response.dart';
import 'package:mowaterApp/core/networking/api/api_result.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';

class SignUpRepositeory {
  final ApiService _apiService;
  SignUpRepositeory(this._apiService);

  Future<ApiResult> signUp(signUpRequestModel user) async {
    try {
      UserResponse response = await _apiService.signUpUser({
        'confirm_password': user.confiermPasswrod,
        'name': user.name,
        'email': user.email,
        'password': user.password,
        'phone_number': user.phoneNumber,
        'image': user.image,
        'joinedFrom': DateTime.now(),
      });
      if (response.status == 'success') {
        return ApiResult.success(response);
      } else {
        return ApiResult.failure(response.message);
      }
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
