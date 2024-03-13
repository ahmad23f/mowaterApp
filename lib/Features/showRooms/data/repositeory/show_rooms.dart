import 'package:mowaterApp/core/networking/api/api_result.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';

class ShowRoomsRepositeory {
  final ApiService _apiService;
  ShowRoomsRepositeory(this._apiService);
  Future<ApiResult> getAllShowRooms() async {
    try {
      print("=========");
      final response = await _apiService.getAllShowRooms();

      print(response.length);
      print("=========");
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
