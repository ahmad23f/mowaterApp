import 'package:dio/dio.dart';
import 'package:Mowater/Features/insurance/categorys/requestAquate/model/car_insurance_model.dart';
import 'package:Mowater/core/networking/api/api_result.dart';
import 'package:Mowater/core/networking/api/api_service.dart';

class AddCarInsuranceRepository {
  final ApiService _apiService;

  AddCarInsuranceRepository(this._apiService);

  Future<ApiResult> addCar(CarInsuranceModel car) async {
    try {
      final formData = FormData.fromMap({
        'carMake': car.carMake,
        'carModel': car.carModel,
        'carYear': car.carYear,
        'carPrice': car.carPrice,
        'type': car.type,
        'phoneNumber': car.phoneNumber,
        'whatsAppNumber': car.whatsAppNumber,
        'email': car.email,
        'birthday': car.birthday,
        'userName': car.userName,
        'userId': car.userId,
        'dateRequest': car.dateRequest,
      });

      // Call the API service to add the car insurance
      final response = await _apiService.addCarInsurance(formData);
      print(response);
      return ApiResult.success(response);
    } catch (error) {
      // Handle errors
      return ApiResult.failure('Failed to add car insurance: $error');
    }
  }
}
