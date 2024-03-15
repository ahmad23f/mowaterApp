import 'package:Mowater/Features/mowaterMart/data/model/mowater_mart_product_model.dart';
import 'package:dio/dio.dart';
import 'package:Mowater/core/networking/api/api_result.dart';
import 'package:Mowater/core/networking/api/api_service.dart';

class AddNewProductSparePartsRepo {
  final ApiService _apiService;
  AddNewProductSparePartsRepo(this._apiService);

  Future<ApiResult> addProduct(MowaterMartProductModel model) async {
    try {
      final response = await _apiService.addProductSpareParts(FormData.fromMap({
        'types_id': model.typesId,
        'prodect_type': model.prodectType,
        'car_type': model.carType,
        'car_status': model.carStatus,
        'car_model': model.carModel,
        'prodect_date': model.prodectDate,
        'prodect_price': model.prodectPrice,
        'publisher_id': model.publisherId,
        'phone_number': model.phoneNumber,
        'whats_app_number': model.whatsAppNumber,
        'prodect_image': model.prodectImag,
        'isAds': model.isAds,
      }));
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
