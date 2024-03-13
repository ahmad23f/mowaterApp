import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowaterApp/Features/CarsForSale/data/model/car_model.dart';
import 'package:mowaterApp/Features/SellYourCar/data/repositeory/car_repositeory.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';
import 'package:multiple_images_picker/multiple_images_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

part 'show_your_car_cubit.freezed.dart';
part 'show_your_car_state.dart';

class SellYourCarCubti extends Cubit<ShowYourCarState> {
  final ApiService _apiService;
  SellYourCarCubti(this._apiService) : super(const ShowYourCarState.initial());

  List<Asset> images = [];
  List<Asset> resultList = [];

  Future<bool> requestPermission() async {
    bool perm = false;
    if (Platform.isIOS) {
      perm = await permissionPhotos();
    } else if (Platform.isAndroid) {
      final android = await DeviceInfoPlugin().androidInfo;
      final sdkInt = android.version.sdkInt ?? 0;
      perm = sdkInt > 32 ? await permissionPhotos() : await permissionStorage();
    }
    return perm;
  }

  Future<bool> permissionPhotos() async {
    final try0 = await Permission.photos.status;
    if (try0 == PermissionStatus.granted) return true;
    final try1 = await Permission.photos.request();
    return try1 == PermissionStatus.granted;
  }

  Future<bool> permissionStorage() async {
    final try0 = await Permission.storage.status;
    if (try0 == PermissionStatus.granted) return true;
    final try1 = await Permission.storage.request();
    return try1 == PermissionStatus.granted;
  }

  Future<void> addCar(Car car, File file) async {
    AddNewCarRepository addNewCarRepository = AddNewCarRepository(_apiService);
    final response = await addNewCarRepository.addNewCar(file);
    print('=========');

    print(response);
    print('=========');

    response.when(
      success: (data) {
        emit(ShowYourCarState.success(data));
      },
      failure: (error) {
        print(error);
        emit(const ShowYourCarState.faliure());
      },
    );
  }

  Future<File> _getImageFileFromAsset(Asset asset) async {
    final byteData = await asset.getByteData();
    final tempDir =
        await getTemporaryDirectory(); // Get temporary directory using path_provider
    final tempFile = File('${tempDir.path}/${asset.name}');
    await tempFile.writeAsBytes(byteData.buffer.asUint8List());
    return tempFile;
  }
}
