import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'companyes_model.g.dart';

@JsonSerializable()
class MaintenanceCompanyModel {
  int? id;
  String? name;
  @JsonKey(name: 'weekday_work')
  String? weekdayWork;
  @JsonKey(name: 'start_time')
  String? startTime;
  @JsonKey(
    name: 'end_time',
  )
  String? endTime;
  String? specialty;
  String? description;
  String? location;
  String? phoneNumber;
  @JsonKey(name: 'WhatsAppNumber')
  String? whatsappNumber;
  @JsonKey(name: "company_image")
  String? image;
  @JsonKey(name: "category_name")
  String? categoryName;
  @JsonKey(name: 'car_brands')
  List<String>? carBrands;
  int? approval;

  int? mowaterDiscount;
  String? carMakes;
  String? latitude;
  String? longitude;

  MaintenanceCompanyModel({
    required this.mowaterDiscount,
    required this.latitude,
    this.carBrands,
    this.approval,
    this.longitude,
    this.carMakes,
    this.categoryName,
    this.image,
    this.id,
    this.name,
    this.weekdayWork,
    this.startTime,
    this.endTime,
    this.specialty,
    this.description,
    this.location,
    this.phoneNumber,
    required this.whatsappNumber,
  });

  factory MaintenanceCompanyModel.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceCompanyModelFromJson(json);

  Map<String, dynamic> toJson() => _$MaintenanceCompanyModelToJson(this);
}
