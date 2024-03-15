import 'package:Mowater/core/networking/api/api_result.dart';
import 'package:Mowater/core/networking/api/api_service.dart';

class SparePartsCategoryRepositeory {
  final ApiService _apiService;
  SparePartsCategoryRepositeory(this._apiService);
  Future<ApiResult> getCompanyAt(
      int id, int? state, country, carModelId, searchQuery) async {
    final response = await _apiService.getSparePartsCompanyInCategory(
        id, state, country, carModelId, searchQuery);

    try {
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
