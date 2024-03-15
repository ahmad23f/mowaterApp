import 'package:Mowater/core/networking/api/api_result.dart';
import 'package:Mowater/core/networking/api/api_service.dart';

class CarCareCompaniesRepositeory {
  final ApiService _apiService;
  CarCareCompaniesRepositeory(this._apiService);

  Future<ApiResult> getCompanies(
      {String? location, required int categoryId, String? searchQuery}) async {
    try {
      final response = await _apiService.getCarCareCompanies(
          categoryId, location, searchQuery);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
