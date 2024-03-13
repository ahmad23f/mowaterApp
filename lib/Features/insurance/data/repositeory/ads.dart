import 'package:mowaterApp/core/networking/api/api_result.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';

class InsuranceMainAdsRepositeory {
  final ApiService _apiService;
  InsuranceMainAdsRepositeory(this._apiService);

  Future<ApiResult> getMainAds() async {
    try {
      final response = await _apiService.getInsuranceMainAds();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  getAdsInCategory(int categoryId) async {
    final response = await _apiService.getInsuranceAdsByCatogy(categoryId);
    print('============');

    print(response);
    print('============');
    try {
      print(response);
      return ApiResult.success(response);
    } catch (e) {
      print(e);
      return ApiResult.failure(e.toString());
    }
  }
}
