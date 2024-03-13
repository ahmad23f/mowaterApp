import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mowater_mart_product_model.g.dart';

@JsonSerializable()
class MowaterMartProductModel {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'types_id')
  final int? typesId;
  @JsonKey(name: 'prodect_type')
  final String? prodectType;
  @JsonKey(name: 'car_type')
  final String? carType;
  @JsonKey(name: 'car_status')
  final int? carStatus;
  @JsonKey(name: 'car_model')
  final String? carModel;
  @JsonKey(name: 'prodect_date')
  final String? prodectDate;
  @JsonKey(name: 'prodect_price')
  final String? prodectPrice;
  @JsonKey(name: 'publisher_id')
  final int? publisherId;
  @JsonKey(name: 'phone_number')
  final int? phoneNumber;
  @JsonKey(name: 'whats_app_number')
  final int? whatsAppNumber;
  @JsonKey(name: 'prodect_image')
  final String? prodectImag;
  @JsonKey(name: 'isAds')
  final int? isAds;
  final String longitude;
  final String location;
  final String latitude;

  MowaterMartProductModel({
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.isAds,
    required this.id,
    required this.typesId,
    required this.prodectType,
    required this.carType,
    required this.carStatus,
    required this.carModel,
    required this.prodectDate,
    required this.prodectPrice,
    required this.publisherId,
    required this.phoneNumber,
    required this.whatsAppNumber,
    required this.prodectImag,
  });

  factory MowaterMartProductModel.fromJson(Map<String, dynamic> json) =>
      _$MowaterMartProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$MowaterMartProductModelToJson(this);
}
