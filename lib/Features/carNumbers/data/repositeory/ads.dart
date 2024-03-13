import 'package:mowaterApp/core/helper/ads_model.dart';
import 'package:mowaterApp/core/networking/api/api_result.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';

class PlateAdsRepositeory {
  final ApiService _apiService;
  PlateAdsRepositeory(this._apiService);
  Future<ApiResult<List<AdsModel>>> getAllTrending() async {
    try {
      List<AdsModel> trendingModel = await _apiService.getPlateMainAds();

      return ApiResult.success(trendingModel);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<List<AdsModel>>> getInCountry(int country) async {
    try {
      List<AdsModel> trendingModel =
          await _apiService.getAdsForPlatesCateogyr(country);

      return ApiResult.success(trendingModel);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
