import 'package:Mowater/Features/MaintenanceServices/data/model/ads/maintenance_ads_model.dart';
import 'package:Mowater/core/models/user_model.dart';
import 'package:Mowater/core/networking/api/api_result.dart';
import 'package:Mowater/core/networking/api/api_service.dart';

class MaintenanceAdsByCategoryRepositeory {
  final ApiService _apiServis;

  MaintenanceAdsByCategoryRepositeory(this._apiServis);

  Future<ApiResult<List<MaintenanceAdsModel>>> GetMaintenanceAds(
      String categoryId) async {
    try {
      final response = await _apiServis
          .gettMaintenanceServiceAdsById({"categoryId": categoryId});
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
