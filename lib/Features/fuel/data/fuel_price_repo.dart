import 'package:Mowater/core/networking/api/api_result.dart';
import 'package:Mowater/core/networking/api/api_service.dart';

class FuelPriceRepositeory {
  final ApiService _apiService;
  FuelPriceRepositeory(this._apiService);

  Future<ApiResult> getPrices() async {
    try {
      print('t');
      final response = await _apiService.getFuelPrice();
      print(response);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
