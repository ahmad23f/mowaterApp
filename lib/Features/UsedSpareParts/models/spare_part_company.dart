import 'package:json_annotation/json_annotation.dart';

part 'spare_part_company.g.dart';

@JsonSerializable()
class SpatepartsCompanyModel {
  @JsonKey(name: 'id')
  int companyId;
  @JsonKey(name: 'company_image')
  String companyImage;
  String name;
  @JsonKey(name: 'start_time')
  String startTime;
  @JsonKey(name: 'end_time')
  String endTime;
  String phoneNumber;
  String whatsAppNumber;
  @JsonKey(name: 'weekday_work')
  List<String> daysWeek;
  String createAccountAt;
  String location;
  int mowaterDiscount;
  @JsonKey(name: 'car_brand_names')
  List<String> carBrandNames;
  List<SparePartProduct> products;

  SpatepartsCompanyModel(
      {required this.companyId,
      required this.location,
      required this.companyImage,
      required this.name,
      required this.startTime,
      required this.endTime,
      required this.phoneNumber,
      required this.whatsAppNumber,
      required this.daysWeek,
      required this.createAccountAt,
      required this.mowaterDiscount,
      required this.carBrandNames,
      required this.products});

  factory SpatepartsCompanyModel.fromJson(Map<String, dynamic> json) =>
      _$SpatepartsCompanyModelFromJson(json);

  Map<String, dynamic> toJson() => _$SpatepartsCompanyModelToJson(this);
}

@JsonSerializable()
class SparePartProduct {
  int productId;
  String productName;
  String productPrice;
  // String type;
  String image;
  @JsonKey(name: 'productState')
  int state;
  int categoryId;
  @JsonKey(name: 'category_name')
  String categoryName;

  SparePartProduct(
      {required this.productId,
      required this.image,
      required this.productName,
      required this.productPrice,
      // required this.type,
      required this.state,
      required this.categoryId,
      required this.categoryName});

  factory SparePartProduct.fromJson(Map<String, dynamic> json) =>
      _$SparePartProductFromJson(json);

  Map<String, dynamic> toJson() => _$SparePartProductToJson(this);
}
