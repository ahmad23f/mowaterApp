import 'package:Mowater/core/networking/api/api_result.dart';
import 'package:Mowater/core/networking/api/api_service.dart';

class RentalCarsRepositeory {
  final ApiService _apiService;
  RentalCarsRepositeory(this._apiService);

  Future<ApiResult> getAds() async {
    try {
      final response = await _apiService.getRentalCarsAds();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult> getAllRentalCarsCompany() async {
    final response = await _apiService.getAllRentalCarsCompany();

    try {
      print(response);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
