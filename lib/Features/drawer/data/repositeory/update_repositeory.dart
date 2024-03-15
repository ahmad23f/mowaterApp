import 'package:Mowater/core/models/user_model.dart';
import 'package:Mowater/core/networking/api/api_result.dart';
import 'package:Mowater/core/networking/api/api_service.dart';
import 'package:dio/dio.dart';

class UpdateRepositeory {
  final ApiService _apiService;
  UpdateRepositeory(this._apiService);

  Future<ApiResult> updateInformation(UserModel user) async {
    try {
      print('try update withe id : ${user.id}');
      final response = await _apiService.updateProfile(FormData.fromMap({
        'id': user.id,
        'name': user.name,
        'password': user.password,
        'nickName': user.nickName,
        'email': user.email,
        'phoneNumber': user.phoneNumber,
        'whatsAppNumber': user.whatsAppNumber,
        'image': user.image,
        'description': user.description,
        'mowaterDiscount': user.mowaterDiscount,
        'specialtyCategorys': user.specialtyCategorys,
        'workDays': user.workDays,
        'startTime': user.startTime,
        'endTime': user.endTime,
        'location': user.location,
        'latitude': user.latitude,
        'longitude': user.longitude,
        'subscriptionState': user.subscriptionState,
        'carMakes': user.carMakes,
        'whatsAppVerificationCode': user.whatsAppVerificationCode,
        'phoneNumberVerificationCode': user.phoneNumberVerificationCode,
        'emailVerificationCode': user.emailVerificationCode,
        'lastUpdatePhone': user.lastUpdatePhone?.toIso8601String(),
        'lastUpdateWhatsAppNumber':
            user.lastUpdateWhatsAppNumber?.toIso8601String(),
        'emailState': user.emailState,
      }));
      print('=======================');

      print(response);
      print('=======================');
      if (response.status == 'success') {
        return ApiResult.success(response);
      } else {
        return ApiResult.failure(response.message);
      }
    } catch (e) {
      return const ApiResult.failure('There a unkown error');
    }
  }
}
