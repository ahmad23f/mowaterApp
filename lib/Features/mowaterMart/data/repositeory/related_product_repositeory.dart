import 'package:Mowater/Features/mowaterMart/data/model/mowater_mart_product_model.dart';
import 'package:Mowater/core/networking/api/api_result.dart';
import 'package:Mowater/core/networking/api/api_service.dart';

class RelatedProductRepositeory {
  final ApiService _apiService;

  RelatedProductRepositeory(this._apiService);

  Future<ApiResult<List<MowaterMartProductModel>>> getRelated(
      int id, int typeId) async {
    print(id);
    print(typeId);
    try {
      final response = await _apiService.getRelatedProduct(id, typeId);

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
