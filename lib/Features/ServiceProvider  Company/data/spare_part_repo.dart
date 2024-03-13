// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:mowaterApp/Features/ServiceProvider%20%20Company/model/service_account.dart';
// import 'package:mowaterApp/Features/signUp/data/models/user_response.dart';
// import 'package:mowaterApp/core/helper/get_city_name_by_lat_long_tude.dart';
// import 'package:mowaterApp/core/networking/api/api_result.dart';
// import 'package:mowaterApp/core/networking/api/api_service.dart';
// import 'package:mowaterApp/core/services/user_state.dart';

// class ServiceProviderShowRoomRepo {
//   final ApiService _apiService;
//   ServiceProviderShowRoomRepo(this._apiService);

//   Future<ApiResult> addServiceProvider({
//     required ServiceProviderAccountModel accountModel,
//   }) async {
//     try {
//       print('try it');

//       var formData = FormData.fromMap({
//         'commercialLicenseNumber': accountModel.commercialLicenseNumber,
//         'name': accountModel.tradeName,
//         'days': accountModel.selectedDays ?? '',
//         'location': await getCityName(
//                 accountModel.latitude!, accountModel.longitude!) ??
//             '',
//         'mowaterDiscount': accountModel.mowaterDiscount ?? '',
//         'callNumber': accountModel.number ?? '',
//         'whatsAppNumber': accountModel.whatssApp ?? '',
//         'descreption': accountModel.descreption ?? '',
//         'startTime': accountModel.startTime ?? '',
//         'endTime': accountModel.endTime ?? '',
//         'specifications': accountModel.selectedSpecialties ?? '',
//         'longitude': accountModel.longitude.toString(),
//         'latitude': accountModel.latitude.toString(),
//         'password': accountModel.password ?? '',
//         'phoneNumber': accountModel.number ?? '',
//         'approval': 0
//       });

//       // Add companyImage if available
//       if (accountModel.image != null) {
//         formData.files.add(MapEntry(
//           'company_image',
//           await MultipartFile.fromFile(
//             accountModel.image!.path,
//           ),
//         ));
//       }

//       // Add attachment if available
//       if (accountModel.pdfFile != null) {
//         formData.files.add(MapEntry(
//           'attachment',
//           await MultipartFile.fromFile(
//             accountModel.pdfFile!.path,
//           ),
//         ));
//       }
//       print('!===========well try now !===========');
//       final response = await _apiService.addSparePartCompany(formData);

//       print(response);
//       final data = response is Map ? response : jsonDecode(response);
//       print(data);

//       if (data['status'] == 'success') {
//         UserServices.saveLoginState(UserModel(
//             userType: 'showRoom',
//             name: data['data']['name'],
//             image: data['data']['company_image'],
//             id: int.parse(data['data']['avilableCars']),
//             whatsappNumber: data['data']['whatsAppNumber'],
//             phoneNumber: data['data']['callNumber']));
//         print('add  succeffly');
//         return ApiResult.success(data);
//       } else {
//         return ApiResult.failure(data['message']);
//       }
//     } catch (e) {
//       return ApiResult.failure(e.toString());
//     }
//   }
// }
