import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mowaterApp/Features/MaintenanceServices/data/model/companys/companyes_model.dart';
import 'package:mowaterApp/Features/ServiceProvider%20%20Company/data/maintenance_rep.dart';
import 'package:mowaterApp/core/networking/api/api_result.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';
import 'package:mowaterApp/core/services/company_service.dart';
import 'package:mowaterApp/core/services/user_state.dart';

class EditProfileNormalCompany {
  final ApiService _apiService;

  EditProfileNormalCompany(this._apiService);

  Future<ApiResult> updateMaintenanceCompany(
      MaintenanceCompanyModel companyModel) async {
    try {
      print("ID: ${UserServices.getUserInformation().id}");
      print('===========try=====');

      final response =
          await _apiService.editProfileNormalCompany(FormData.fromMap({
        'id': NormalCompanyService.getCompanyData().id,
        'table': NormalCompanyService.getCompanyData().companyType,
        'name': companyModel.name,
        'weekday_work': companyModel.weekdayWork,
        'start_time': companyModel.startTime,
        'end_time': companyModel.endTime,
        'specialty': companyModel.specialty,
        'description': companyModel.description,
        'location': companyModel.location,
        'phoneNumber': companyModel.phoneNumber,
        'WhatsAppNumber': companyModel.whatsappNumber,
        'company_image': companyModel.image,
        'category_name': companyModel.categoryName,
        'mowater_discount': companyModel.mowaterDiscount,
        'carMakes': companyModel.carMakes,
        'latitude': companyModel.latitude,
        'longitude': companyModel.longitude,
      }));
      final decodedDat = jsonDecode(response);

      print('===========end=====');

      print(response);
      await saveNormalCompanyData(decodedDat);
      print('===========end=====');
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(
          'Wrong Error Contact Withe Us And Tell Us The Error Code Is :${e.hashCode}');
    }
  }
}
