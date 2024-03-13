import 'package:hive_flutter/adapters.dart';
import 'package:mowaterApp/Features/Parking/models/plate_model.dart';
import 'package:mowaterApp/core/networking/api/api_result.dart';

class PlateService {
  static Future<ApiResult> addPlate(
    PlateModel plate,
  ) async {
    final box = await Hive.openBox<PlateModel>('plate');

    try {
      await box.add(PlateModel(
          lastUse: DateTime(1),
          nickName: plate.nickName,
          plateNumber: plate.plateNumber,
          plateSource: plate.plateSource,
          plateCode: plate.plateCode));
      return const ApiResult.success('');
    } catch (e) {
      return const ApiResult.failure('Plate Not Save Try Again Later!');
    }
  }

  static Future<ApiResult> deletePlate(int plateIndex) async {
    print(plateIndex);
    final box = await Hive.openBox<PlateModel>('plate');

    try {
      print('object');
      await box.deleteAt(plateIndex);

      return const ApiResult.success('');
    } catch (e) {
      return const ApiResult.failure('Plate Not Save Try Again Later!');
    }
  }

  static Future<List<PlateModel>> getByLastUserAllPlates() async {
    final box = await Hive.openBox<PlateModel>('plate');

    List<PlateModel> plates = [];

    try {
      plates = box.values.toList();

      // Sort the list by the lastUse field
      plates.sort((a, b) => a.lastUse.compareTo(b.lastUse));

      // Reverse the order of the sorted list
      plates = plates.reversed.toList();

      return plates;
    } catch (e) {
      return [];
    }
  }

  static Future<List<PlateModel>> getAllPlate() async {
    final box = await Hive.openBox<PlateModel>('plate');

    return box.values.toList();
  }

  static Future findPlateIndexByCode(PlateModel plateCode) async {
    print(plateCode.nickName);
    final box = Hive.box<PlateModel>('plate');

    for (int i = 0; i < box.length; i++) {
      final plate = box.getAt(i);
      print(plate!.nickName);
      if (plate.nickName == plateCode.nickName) {
        await box.deleteAt(i);

        box.put(
            i,
            PlateModel(
                lastUse: DateTime.now(),
                nickName: plate.nickName,
                plateNumber: plate.plateNumber,
                plateSource: plate.plateSource,
                plateCode: plate.plateCode));

        return 0;
      } else {}
    }

    return -1; // Return -1 if no plate with the specified plateCode is found
  }
}
