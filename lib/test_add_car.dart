import 'dart:io';
import 'package:dio/dio.dart';
import 'package:mowaterApp/Features/CarsForSale/data/model/car_model.dart';
import 'package:mowaterApp/core/networking/api_constant.dart';

class addCar {
  static final Dio _dio = Dio();

  Future<void> addCarme(Car car, List<File> images) async {
    try {
      String url =
          "${ApiConstans.baseUrl}${ApiConstans.addNewCar}"; // Replace this with your API endpoint

      // Create FormData and add car details
      FormData formData = FormData.fromMap({
        'carMake': car.carMake,
        'carModel': car.carModel,
        'year': car.year,
        'cylinders': car.cylinders,
        'specifications': car.specifications,
        'condition': car.condition,
        'location': car.location,
        'exteriorColor': car.exteriorColor,
        'interiorColor': car.interiorColor,
        'gearBox': car.gearBox,
        'fuelType': car.fuelType,
        'warranty': car.warranty,
        'doors': car.doors,
        'kilometer': car.kilometer,
        'price': car.price,
        'whatsappNumber': car.whatsappNumber,
        'callNumber': car.phoneNumber,
        'userId': car.userId,
        'isAprove': car.isAprove,
        'isAds': car.isAds,
        'createdAt': car.createdAt,
      });

      // Add image files to FormData
      for (int i = 0; i < images.length; i++) {
        String fileName = 'image$i';
        formData.files.add(MapEntry(
          'images[$i]',
          MultipartFile.fromFileSync(images[i].path, filename: fileName),
        ));
      }

      // Send POST request
      Response response = await _dio.post(url, data: formData);

      // Handle response
      if (response.statusCode == 200) {
        // Car added successfully
        print("Car added successfully");
        print(response);
      } else {
        // Error adding car
        print("Failed to add car. Error: ${response.data}");
      }
    } catch (e) {
      // Exception occurred
      print("Exception while adding car: $e");
    }
  }
}
