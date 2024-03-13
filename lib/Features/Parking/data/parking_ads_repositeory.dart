import 'package:mowaterApp/core/networking/api/api_result.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';

class ParkingAdsRepositeory {
  final ApiService _apiService;
  ParkingAdsRepositeory(this._apiService);
  Future<ApiResult> getAdsInEmirateName(int id) async {
    try {
      final response = await _apiService.getParkingAdsIn(id);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult> getMainParkingAds() async {
    try {
      final response = await _apiService.getMainParkingAds();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
