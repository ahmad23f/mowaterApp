import 'package:mowaterApp/core/networking/api/api_result.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';

class GetMaySparePartProductRepo {
  final ApiService _apiService;
  GetMaySparePartProductRepo(this._apiService);
  Future<ApiResult> getMyProdcut(int id) async {
    try {
      final response = await _apiService.getMyProductSpareParts(id);

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
