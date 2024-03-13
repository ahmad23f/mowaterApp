import 'package:mowaterApp/Features/MaintenanceServices/data/model/companys/companyes_model.dart';
import 'package:mowaterApp/core/networking/api/api_result.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';

class MerchantByIdRepository {
  final ApiService _apiService;

  MerchantByIdRepository(this._apiService);

  Future<ApiResult<List<MaintenanceCompanyModel>>> getMerchantById(
      {required int id, String? location, int? carMake, String? search}) async {
    try {
      print('=======');

      final response = await _apiService.getMaintenanceServiceBySpecialty(
          id, location, carMake, search);
      return ApiResult.success(response);
    } catch (e) {
      print('=======');

      print(e);
      print('=======');
      return ApiResult.failure(e.toString());
    }
  }
}
