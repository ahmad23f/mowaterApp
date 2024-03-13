import 'package:mowaterApp/Features/home/models/trendingModel/trend_model.dart';
import 'package:mowaterApp/core/networking/api/api_result.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';

class TrendRepsiteory {
  final ApiService _apiService;
  TrendRepsiteory(this._apiService);
  Future<ApiResult<List<TrendingModel>>> getAllTrending() async {
    try {
      List<TrendingModel> trendingModel = await _apiService.getAllTrending();

      return ApiResult.success(trendingModel);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
