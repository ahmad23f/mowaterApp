import 'dart:io';

import 'package:Mowater/core/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:Mowater/core/networking/api/api_result.dart';
import 'package:Mowater/core/networking/api/api_service.dart';
import 'package:Mowater/core/services/user_state.dart';

class UpdateUserInformationRepositeory {
  final ApiService _apiService;
  UpdateUserInformationRepositeory(this._apiService);

  Future<ApiResult> update(UserModel user, File? file) async {
    FormData formData = FormData.fromMap({
      'id': user.id,
      "name": user.name,
      'nickname': user.nickName,
      'phone_number': user.phoneNumber,
      'whatsappNumber': user.whatsAppNumber,
      'password': user.password
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
        // UserServices.updateUserInfo(
        //     emailState: response.user.emailState,
        //     whatsState: response.user.whatsAppNumber,
        //     email: response.user.email,
        //     phoneNumber: response.user.phoneNumber,
        //     image: response.user.image,
        //     nickName: response.user.nickname,
        //     lastUpdatePhoneNumber: response.user.lastUpdatePhoneNumber,
        //     whatsappNumber: response.user.whatsappNumber,
        //     lastUpdateWhatsAppNumber: response.user.lastUpdateWhatsAppNumber,
        //     username: response.user.name);

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
