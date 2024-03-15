// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:Mowater/Features/CarsForSale/data/model/carModelProduct/car_model_product.dart';
// import 'package:Mowater/Features/CarsForSale/data/model/car_model.dart';
// import 'package:Mowater/core/networking/api/api_result.dart';
// import 'package:Mowater/core/networking/api/api_service.dart';
// import 'package:Mowater/core/services/user_state.dart';

// class ShowRoomAddEditCarRepositeory {
//   final ApiService _apiService;
//   ShowRoomAddEditCarRepositeory(this._apiService);

//   addEditCar(
//       {required Car car,
//       required List<File> images,
//       required int isEdit}) async {
//     FormData formData = FormData.fromMap({
//       'carMake': car.carMake,
//       'carModel': car.carModel,
//       'year': car.year,
//       'cylinders': car.cylinders,
//       'specifications': '_',
//       'condition': car.condition,
//       'location': car.location,
//       'exteriorColor': car.exteriorColor,
//       'interiorColor': car.interiorColor,
//       'gearBox': car.gearBox,
//       'fuelType': car.fuelType,
//       'warranty': car.warranty,
//       'doors': car.doors,
//       'kilometer': car.kilometer,
//       'price': car.price,
//       'whatsappNumber': car.whatsappNumber,
//       'callNumber': car.phoneNumber,
//       'userId': car.userId,
//       'isAprove': car.isAprove,
//       'isAds': car.isAds,
//       'createdAt': car.createdAt,
//       'isEdit': isEdit,
//       'showRoomId': UserServices.getUserInformation().id
//     });
//     for (int i = 0; i < images.length; i++) {
//       String fileName = 'image$i';
//       formData.files.add(MapEntry(
//         'images[$i]',
//         MultipartFile.fromFileSync(images[i].path, filename: fileName),
//       ));
//     }
//     try {
//       final response = await _apiService.showRoomEditAddCar(formData);
//       print(response);
//       return ApiResult.success(response);
//     } catch (e) {
//       return ApiResult.failure(e.toString());
//     }
//   }
// }
