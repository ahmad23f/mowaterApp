import 'package:mowaterApp/core/networking/api/api_result.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';

class CarCareCategoryAdsRepositeory {
  final ApiService _apiService;
  CarCareCategoryAdsRepositeory(this._apiService);
  Future<ApiResult> getCategorAds(int id) async {
    try {
      final response = await _apiService.getCareCareCategoryAds(id);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
