import 'package:Mowater/core/networking/api/api_result.dart';
import 'package:Mowater/core/networking/api/api_service.dart';

class SearchInMaintenaceRepositeory {
  final ApiService _apiService;

  SearchInMaintenaceRepositeory(this._apiService);

  Future<ApiResult> search(String name, int categoryId) async {
    try {
      final response = await _apiService
          .searchInMaintenance({"name": name, 'id': categoryId});
      return ApiResult.success(response);
    } catch (e) {
      // If an exception occurs during the API call, return failure
      return ApiResult.failure(e.toString());
    }
  }
}
