import 'package:Mowater/Features/carNumbers/models/plate_model.dart';
import 'package:Mowater/core/networking/api/api_result.dart';
import 'package:Mowater/core/networking/api/api_service.dart';

class PlateCategoryRepositeory {
  final ApiService _apiService;
  PlateCategoryRepositeory(this._apiService);
  Future<ApiResult<List<PlateModelForSale>>> getPlates({
    required String source,
    String? plateNumber,
    String? maxPrice,
    String? minPrice,
    int? plateLength,
  }) async {
    try {
      List<PlateModelForSale> plates = await _apiService.getPlateCategory(
          source, plateNumber, minPrice, maxPrice, plateLength);
      return ApiResult.success(plates);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
