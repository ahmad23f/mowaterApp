import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mowaterApp/core/networking/api/api_result.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';

class AddNewCarRepository {
  final ApiService _apiService;
  AddNewCarRepository(this._apiService);

  Future<ApiResult> addNewCar(File imagePath) async {
    try {
      // Create a FormData object to include both carModel and the image
      FormData formData = FormData.fromMap({
        'images': await MultipartFile.fromFile(imagePath.path),
      });

      // Send the FormData object along with the request
      final response = await _apiService.addCar(formData);

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
