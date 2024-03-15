import 'package:Mowater/Features/MaintenanceServices/data/model/trending_service.dart';
import 'package:Mowater/core/networking/api/api_result.dart';
import 'package:Mowater/core/networking/api/api_service.dart';

class TrendingServicesRepositeory {
  final ApiService _apiService;
  TrendingServicesRepositeory(this._apiService);

  Future<ApiResult<List<TrendingServicesModel>>> getTrendingService() async {
    try {
      final response = await _apiService.getTrendingService();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
