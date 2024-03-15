import 'package:Mowater/Features/mowaterMart/data/model/mowater_mart_product_model.dart';
import 'package:Mowater/core/networking/api/api_result.dart';
import 'package:Mowater/core/networking/api/api_service.dart';

class MowaterMartRepositeory {
  final ApiService _apiService;
  MowaterMartRepositeory(this._apiService);

  Future<ApiResult<List<MowaterMartProductModel>>> getProdect(
      {int? page, int? state, int? carModel, String? search, int? year}) async {
    try {
      final response = await _apiService.getMowaterMarket(
          page, state, carModel, search, year);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<List<MowaterMartProductModel>>> searchProduct(
      {int? state, int? carModel, String? search, int? year}) async {
    try {
      final response = await _apiService.searchInMowaterMarket(
          state, carModel, search, year);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
