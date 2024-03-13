// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/adapters.dart';
part 'plate_model.g.dart';

@HiveType(typeId: 1)
class PlateModel {
  @HiveField(0)
  String nickName;
  @HiveField(1)
  String plateNumber;
  @HiveField(2)
  String plateSource;
  @HiveField(3)
  String plateCode;
  @HiveField(4)
  DateTime lastUse;
  PlateModel({
    required this.lastUse,
    required this.nickName,
    required this.plateNumber,
    required this.plateSource,
    required this.plateCode,
  });
}
