import 'package:mowaterApp/core/networking/api/api_result.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';

class BrandsAdsRepositeory {
  final ApiService _apiService;

  BrandsAdsRepositeory(this._apiService);

  Future<ApiResult> getAdsInBrands() async {
    try {
      final response = await _apiService.getBrandsAds();

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
