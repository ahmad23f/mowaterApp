// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:Mowater/Features/ServiceProvider%20%20Company/model/service_account.dart';
// import 'package:Mowater/core/helper/get_city_name_by_lat_long_tude.dart';
// import 'package:Mowater/core/networking/api/api_result.dart';
// import 'package:Mowater/core/networking/api/api_service.dart';
// import 'package:Mowater/core/networking/models/api_status.dart';
// import 'package:Mowater/core/services/company_model.dart';
// import 'package:Mowater/core/services/company_service.dart';

// class ServiceProviderMaintenance {
//   final ApiService _apiService;
//   // ServiceProviderMaintenance(this._apiService);

//   Future<ApiResult> addServiceProvider(
//       {required ServiceProviderAccountModel accountModel,
//       required String tableName}) async {
//     try {
//       print('===========try===========');

//       final formData = FormData.fromMap({
//         'table_name': tableName,
//         'password': accountModel.password,
//         'weekday_work': accountModel.selectedDays, //
//         'start_time': accountModel.startTime,
//         'end_time': accountModel.endTime,
//         'specialty': accountModel.selectedSpecialties,
//         'description': accountModel.descreption,
//         'location': await getCityName(
//             accountModel.latitude!, accountModel.longitude!), //
//         'phoneNumber': accountModel.number,
//         'WhatsAppNumber': accountModel.whatssApp,
//         'mowater_discount': accountModel.mowaterDiscount ?? 0,
//         'carMakes': '',
//         'approval': '1',
//         'latitude': accountModel.latitude.toString(),
//         'longitude': accountModel.longitude.toString(),
//         'name': accountModel.tradeName,
//         'commercialLicenseNumber': accountModel.commercialLicenseNumber,
//         // 'provider_type': accountModel.providerTypeInsurance
//       });

//       if (accountModel.image != null) {
//         formData.files.add(MapEntry(
//           'company_image', //
//           await MultipartFile.fromFile(
//             accountModel.image!.path,
//           ),
//         ));
//       }

//       if (accountModel.pdfFile != null) {
//         formData.files.add(MapEntry(
//           'attachment',
//           await MultipartFile.fromFile(
//             accountModel.pdfFile!.path,
//           ),
//         ));
//       }
//       print('=========try send=============');

//       final response = await _apiService.addServicePrviderMaintenance(formData);
//       print(response);
//       print('===============');
//       NormalCompanyService.saveCompanyData(NormalCompanyModelHive(
//           // companyType: response['data']['table_name'],
//           weekdayWork: response['data']['weekday_work'],
//           startTime: response['data']['start_time'],
//           endTime: response['data']['end_time'],
//           specialty: response['data']['specialty'],
//           description: response['data']['description'],
//           location: response['data']['location'],
//           phoneNumber: response['data']['phoneNumber'],
//           whatsappNumber: response['data']['WhatsAppNumber'],
//           // mowaterDiscount: response['data']['mowater_discount'],
//           // carMakes: response['data']['carMakes'],
//           latitude: response['data']['latitude'],
//           longitude: response['data']['longitude'],
//           name: response['data']['name'],
//           companyToken: response['companyToken'],
//           id: response['id'],
//           image: response['companyImage']));

//       final data = response is Map ? response : jsonDecode(response);
//       print(data);
//       if (data['status'] == 'success') {
//         print(data);
//         return ApiResult.success(data['message']);
//       } else {
//         print(data['status']);
//         return ApiResult.failure(data['message']);
//       }
//     } catch (e) {
//       return ApiResult.failure(e.toString());
//     }
//   }
// }
