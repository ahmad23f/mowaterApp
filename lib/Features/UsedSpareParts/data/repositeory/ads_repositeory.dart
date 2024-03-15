import 'package:Mowater/core/networking/api/api_result.dart';
import 'package:Mowater/core/networking/api/api_service.dart';

class UsedSparePartsRepositeory {
  final ApiService _apiService;
  UsedSparePartsRepositeory(this._apiService);
  Future<ApiResult> getMainAds() async {
    try {
      final resposne = await _apiService.getUsedSparePartsMainAds();
      return ApiResult.success(resposne);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult> getCategoryAds(int categoryId) async {
    final resposne = await _apiService.getUsedSparePartsCategoryAds(categoryId);
    try {
      print('============');

      print(resposne);
      print('============');

      return ApiResult.success(resposne);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
