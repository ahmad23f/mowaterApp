import 'package:mowaterApp/core/networking/api/api_result.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';
import 'package:mowaterApp/core/services/user_state.dart';

class AddAccountNumberUserRepositeory {
  final ApiService _apiService;
  AddAccountNumberUserRepositeory(this._apiService);

  Future<ApiResult> updateNumber(
      {required String userToken,
      required String number,
      String? numberType}) async {
    print(numberType);

    try {
      final response = await _apiService.updatePhoneNumber({
        "user_token": userToken,
        "new_contact": '+971$number',
        'contact_type': numberType == 'Phone Number' ? "phone" : 'whatsapp'
      });

      numberType == 'Phone Number'
          ? UserServices.updateUserInfo(
              lastUpdatePhoneNumber: DateTime.now(),
            )
          : UserServices.updateUserInfo(
              lastUpdateWhatsAppNumber: DateTime.now());
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
