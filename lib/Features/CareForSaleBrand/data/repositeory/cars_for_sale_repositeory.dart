import 'package:mowaterApp/Features/CarsForSale/data/model/carModelProduct/car_model_product.dart';
import 'package:mowaterApp/core/networking/api/api_result.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';

class CarsForSaleRepositeory {
  final ApiService _apiservice;
  CarsForSaleRepositeory(this._apiservice);

  Future<ApiResult<List<CarProduct>>> getAllCarsForSale(
    int page,
  ) async {
    final response = await _apiservice.getAllCarsInALlCategory(
      page,
    );

    try {
      print(response);

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

  Future<ApiResult<List<CarProduct>>> filteringCars(
      {String? search,
      int? carMake,
      String? minPrice,
      String? maxPrice,
      String? location}) async {
    final response = await _apiservice.getFilteringCarsForSale(
        search, carMake, minPrice, maxPrice, location);

    try {
      print(response);

      return ApiResult.success(response);
    } catch (e) {
      print('===');
      print(e);
      print('===');

      return ApiResult.failure(e.toString());
    }
  }
}
