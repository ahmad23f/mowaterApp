import 'package:Mowater/core/networking/api/api_result.dart';
import 'package:Mowater/core/networking/api/api_service.dart';

class CompanysAndBrokersRepositeory {
  final ApiService _apiService;
  CompanysAndBrokersRepositeory(this._apiService);
  Future<ApiResult> getProviderType(int type) async {
    final response = await _apiService.getInsuranceProvidreService(type);
    print('========');

    print(response);
    print('========');

    try {
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
