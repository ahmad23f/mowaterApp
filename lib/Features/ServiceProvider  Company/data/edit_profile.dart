// import 'package:dio/dio.dart';
// import 'package:Mowater/Features/MaintenanceServices/data/model/companys/companyes_model.dart';
// import 'package:Mowater/Features/signUp/data/models/user_response.dart';
// import 'package:Mowater/core/networking/api/api_result.dart';
// import 'package:Mowater/core/networking/api/api_service.dart';
// import 'package:Mowater/core/services/user_state.dart';

// class EditProfileNormalCompany {
//   final ApiService _apiService;

//   EditProfileNormalCompany(this._apiService);

//   Future<ApiResult> updateMaintenanceCompany(
//       MaintenanceCompanyModel companyModel) async {
//     try {
//       print('=======');

//       print("ID: ${UserServices.getUserInformation().id}");
//       print('===========try=====');

//       final response =
//           await _apiService.editProfileNormalCompany(FormData.fromMap({
//         'id': 69,
//         'table': 'MaintenanceCompanies',
//         'name': companyModel.name,
//         'weekday_work': companyModel.weekdayWork,
//         'start_time': companyModel.startTime,
//         'end_time': companyModel.endTime,
//         'specialty': companyModel.specialty,
//         'description': companyModel.description,
//         'location': companyModel.location,
//         'phoneNumber': companyModel.phoneNumber,
//         'WhatsAppNumber': companyModel.whatsappNumber,
//         'company_image': companyModel.image,
//         'category_name': companyModel.categoryName,
//         'mowater_discount': companyModel.mowaterDiscount,
//         'carMakes': companyModel.carMakes,
//         'latitude': companyModel.latitude,
//         'longitude': companyModel.longitude,
//       }));

//       print('===========end=====');

//       print(response);
//       print('===========end=====');

//       return ApiResult.success(response);
//     } catch (e) {
//       return ApiResult.failure(
//           'Wrong Error Contact Withe Us And Tell Us The Error Code Is :${e.hashCode}');
//     }
//   }
// }
