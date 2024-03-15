import 'package:Mowater/core/networking/api/api_result.dart';
import 'package:Mowater/core/networking/api/api_service.dart';

class AdsShowRoomsRepositeory {
  final ApiService _apiService;
  AdsShowRoomsRepositeory(this._apiService);
  Future<ApiResult> getAds() async {
    try {
      final response = await _apiService.getShowRoomsAds();

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
