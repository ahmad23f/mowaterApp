import 'package:Mowater/core/networking/api/api_result.dart';
import 'package:Mowater/core/networking/api/api_service.dart';

class AdsRepositeory {
  final ApiService _apiService;
  AdsRepositeory(this._apiService);
  Future<ApiResult> getAdS(String tableName) async {
    try {
      final response = await _apiService.getAds(tableName);

      print(response);
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure('error');
    }
  }
}
