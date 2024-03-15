import 'package:Mowater/core/networking/api/api_result.dart';
import 'package:Mowater/core/networking/api/api_service.dart';

class InspectionRepositeory {
  final ApiService _apiService;
  InspectionRepositeory(this._apiService);
  Future<ApiResult> getCompanys(int? specialty, String? locatin,
      int? mowaterDiscount, String? name) async {
    try {
      final response = await _apiService.getInspectionCompany(
          specialty, locatin, mowaterDiscount, name);

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
