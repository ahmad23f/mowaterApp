import 'package:mowaterApp/Features/home/models/mainCategorys/main_categorys_model.dart';
import 'package:mowaterApp/core/networking/api/api_result.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';

class MainCategorysRepository {
  final ApiService _apiService;
  MainCategorysRepository(this._apiService);

  Future<ApiResult<List<MainCategorysModel>>> getAllCategories() async {
    try {
      List<MainCategorysModel> categories =
          await _apiService.getMainCategorys();

      return ApiResult.success(categories);
    } catch (e) {
      print('Error fetching categories: $e');
      return ApiResult.failure('Failed to load categories: $e');
    }
  }
}
