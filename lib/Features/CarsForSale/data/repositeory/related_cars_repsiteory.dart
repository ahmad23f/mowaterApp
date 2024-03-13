import 'package:mowaterApp/Features/CarsForSale/data/model/carModelProduct/car_model_product.dart';
import 'package:mowaterApp/core/networking/api/api_result.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';

class RelatedCarsRepositeory {
  final ApiService _apiservice;
  RelatedCarsRepositeory(this._apiservice);

  Future<ApiResult<List<CarProduct>>> getRelatedCars(
      String carId, String brandId) async {
    print(carId);
    print(brandId);

    try {
      final response =
          await _apiservice.getRelatedCars({"id": carId, 'type_id': brandId});

      return ApiResult.success(response);
    } catch (e) {
      print('===');
      print(e);
      print('===');

      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<String>> getCarCategoryName(int id) async {
    try {
      final response = await _apiservice.getCareCategoryName(id);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
