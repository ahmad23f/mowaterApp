import 'package:mowaterApp/Features/CareForSaleBrand/data/models/carBrands/cars_model.dart';
import 'package:mowaterApp/core/networking/api/api_result.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';

class CarBrandsRepositeory {
  final ApiService _apiService;

  CarBrandsRepositeory(this._apiService);
  Future<ApiResult<List<CarsBrandsModel>>> getALlBrands() async {
    try {
      final response = await _apiService.getAllCarBrands('isPremium');
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
