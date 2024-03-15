import 'package:intl/intl.dart';
import 'package:Mowater/Features/carNumbers/models/plate_model.dart';
import 'package:Mowater/core/networking/api/api_result.dart';
import 'package:Mowater/core/networking/api/api_service.dart';

class SellYourPlateRepositeory {
  final ApiService _apiService;
  SellYourPlateRepositeory(this._apiService);
  Future<ApiResult> addPlate({required PlateModelForSale plate}) async {
    String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    try {
      final response = await _apiService.sellYourPlate({
        'isApproved': 0,
        'source': plate.source,
        'postAt': formattedDate,
        'code': plate.code,
        'owner': plate.owner,
        'whatsApp': plate.whatsApp,
        'price': plate.price,
        'isNegotiable': plate.isNegotiable,
        'plateNumber': plate.plateNumber,
        'phoneNumber': plate.phoneNmber
      });
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
