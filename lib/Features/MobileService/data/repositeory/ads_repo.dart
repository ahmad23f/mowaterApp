import 'package:Mowater/core/networking/api/api_result.dart';
import 'package:Mowater/core/networking/api/api_service.dart';

class MobileServiceCategoryAdsRepo {
  final ApiService _apiService;
  MobileServiceCategoryAdsRepo(this._apiService);

  Future<ApiResult> getAdsIn(int id) async {
    try {
      final response = await _apiService.getMobileServiceCateogyAds(id);

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
