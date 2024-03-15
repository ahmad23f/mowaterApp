import 'package:Mowater/core/networking/api/api_result.dart';
import 'package:Mowater/core/networking/api/api_service.dart';

class CarBrandsModeelsRepositeory {
  final ApiService _apiService;
  CarBrandsModeelsRepositeory(this._apiService);
  getAllModelsInBrand(String name) async {
    try {
      print(name);
      final response = await _apiService.getAllModelsBrand({'name': name});
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
