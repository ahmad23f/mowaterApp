import 'package:mowaterApp/core/networking/api/api_result.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';

class InspectionAdsRepositeory {
  final ApiService _apiService;
  InspectionAdsRepositeory(this._apiService);
  Future<ApiResult> getAds() async {
    try {
      final response = await _apiService.getInspectionAds();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
