import 'package:mowaterApp/core/networking/api/api_result.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';

class WarrantyCompanyRepositeory {
  final ApiService _apiService;
  WarrantyCompanyRepositeory(this._apiService);
  Future<ApiResult> getCompany(
      {String? search, String? location, int? mowaterDiscount}) async {
    try {
      final response = await _apiService.getWarrantyCompanies(
          location, search, mowaterDiscount);
      print('=======');

      print(response);
      print('=======');
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
