import 'package:Mowater/core/networking/api/api_result.dart';
import 'package:Mowater/core/networking/api/api_service.dart';

class MowaterMartAdsReposite {
  final ApiService _ApiService;
  MowaterMartAdsReposite(this._ApiService);

  Future<ApiResult> getAds() async {
    try {
      final response = await _ApiService.getMowaterMartAds();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
