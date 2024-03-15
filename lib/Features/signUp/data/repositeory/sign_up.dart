import 'dart:io';

import 'package:Mowater/core/helper/get_city_name_by_lat_long_tude.dart';
import 'package:Mowater/core/models/authenticationResponse/authentication_response.dart';
import 'package:Mowater/core/models/user_model.dart';
import 'package:Mowater/core/networking/api/api_result.dart';
import 'package:Mowater/core/networking/api/api_service.dart';
import 'package:dio/dio.dart';

class SignUpRepositeory {
  final ApiService _apiService;
  SignUpRepositeory(this._apiService);

  Future<ApiResult<AuthenticatinResponse>> signUp({
    required UserModel user,
    File? image,
    File? attachment,
  }) async {
    try {
      final response = await _apiService.signUp(FormData.fromMap({
        'id': user.id,
        'type': user.type,
        'name': user.name,
        'password': user.password,
        'nickName': user.nickName,
        'email': user.email,
        'phoneNumber': user.phoneNumber,
        'whatsAppNumber': user.whatsAppNumber,
        'token': user.token,
        'image': await MultipartFile.fromFile(
          image!.path,
        ),
        'commercialLicenesNumber': user.commercialLicenesNumber,
        'description': user.description,
        'mowaterDiscount': user.mowaterDiscount,
        'specialtyCategorys': user.specialtyCategorys,
        'workDays': user.workDays,
        'startTime': user.startTime,
        'endTime': user.endTime,
        'location': await getCityName(
            double.parse(user.latitude!), double.parse(user.longitude!)),
        'latitude': user.latitude,
        'longitude': user.longitude,
        'attachment': await MultipartFile.fromFile(
          attachment!.path,
        ),
        'availableProducts': user.availableProducts,
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
      print('==========');

      print(response.message);
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
