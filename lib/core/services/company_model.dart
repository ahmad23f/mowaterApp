// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

part 'company_model.g.dart';

@HiveType(typeId: 3)
class NormalCompanyModelHive extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? weekdayWork;
  @HiveField(3)
  String? startTime;
  @HiveField(4)
  String? endTime;
  @HiveField(5)
  String? specialty;
  @HiveField(6)
  String? description;
  @HiveField(7)
  String? location;
  @HiveField(8)
  String? phoneNumber;
  @HiveField(9)
  String? whatsappNumber;
  @HiveField(10)
  String? image;
  @HiveField(11)
  String? categoryName;
  @HiveField(12)
  List<String>? carBrands;
  @HiveField(13)
  int? approval;
  @HiveField(14)
  int? mowaterDiscount;
  @HiveField(15)
  String? carMakes;
  @HiveField(16)
  String? latitude;
  @HiveField(17)
  String? longitude;
  @HiveField(18)
  String? companyType;
  @HiveField(19)
  String? companyToken;
  @HiveField(20)
  String? companyImage;

  NormalCompanyModelHive({
    this.companyToken,
    this.companyImage,
    this.companyType,
    this.id,
    this.name,
    this.weekdayWork,
    this.startTime,
    this.endTime,
    this.specialty,
    this.description,
    this.location,
    this.phoneNumber,
    this.whatsappNumber,
    this.image,
    this.categoryName,
    this.carBrands,
    this.approval,
    this.mowaterDiscount,
    this.carMakes,
    this.latitude,
    this.longitude,
  });
}
