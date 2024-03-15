import 'package:Mowater/core/networking/api/api_result.dart';
import 'package:Mowater/core/networking/api/api_service.dart';

class NearRecoveryRepositeory {
  final ApiService _apiService;
  NearRecoveryRepositeory(this._apiService);
  Future<ApiResult> getNear(
      double? lat, double? long, String categoryName) async {
    final response = await _apiService.getNearestRecoveryCompanies(
        "$lat", "$long", categoryName);

    print(response);
    try {
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
