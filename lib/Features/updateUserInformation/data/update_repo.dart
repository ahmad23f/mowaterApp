import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mowaterApp/Features/signUp/data/models/user_response.dart';
import 'package:mowaterApp/core/networking/api/api_result.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';
import 'package:mowaterApp/core/services/user_state.dart';

class UpdateUserInformationRepositeory {
  final ApiService _apiService;
  UpdateUserInformationRepositeory(this._apiService);

  Future<ApiResult> update(UserModel user, File? file) async {
    FormData formData = FormData.fromMap({
      'id': user.id,
      "name": user.name,
      'nickname': user.nickname,
      'phone_number': user.phoneNumber,
      'whatsappNumber': user.whatsappNumber,
      'password': user.passwrod
    });

    if (file != null) {
      formData.files.add(MapEntry(
          'image',
          MultipartFile.fromFileSync(
            user.image!,
          )));
    }
    try {
      final response = await _apiService.updateUserInfo(formData);
      if (response.status == 'success') {
        UserServices.updateUserInfo(
            emailState: response.user.emailState,
            whatsState: response.user.whatsappVerified,
            email: response.user.email,
            phoneNumber: response.user.phoneNumber,
            image: response.user.image,
            nickName: response.user.nickname,
            lastUpdatePhoneNumber: response.user.lastUpdatePhoneNumber,
            whatsappNumber: response.user.whatsappNumber,
            lastUpdateWhatsAppNumber: response.user.lastUpdateWhatsAppNumber,
            username: response.user.name);

        return ApiResult.success(response);
      } else {
        return ApiResult.failure(response.message);
      }
    } catch (e) {
      print(e);
      return const ApiResult.failure('Unkown Error!');
    }
  }
}
