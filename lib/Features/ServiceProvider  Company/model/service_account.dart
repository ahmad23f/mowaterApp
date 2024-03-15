import 'dart:io';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:Mowater/core/services/user_type.dart';

class ServiceProviderAccountModel {
  final File? image;
  final String? tradeName;
  final String? commercialLicenseNumber;
  final String? selectedSpecialties;
  final String? selectedDays;
  final String? startTime;
  final String? endTime;
  final double? latitude;
  final double? longitude;
  final File? pdfFile;
  final String? password;
  final String? specialtyName;
  final String? whatssApp;
  final String? number;
  final String? descreption;
  bool? mowaterDiscount;
  int? providerTypeInsurance;
  ServiceProviderAccountModel(
      {required this.image,
      required this.specialtyName,
      required this.mowaterDiscount,
      required this.tradeName,
      this.providerTypeInsurance,
      this.commercialLicenseNumber,
      this.selectedSpecialties,
      required this.selectedDays,
      required this.startTime,
      required this.endTime,
      required this.latitude,
      required this.longitude,
      this.pdfFile,
      required this.number,
      required this.password,
      required this.whatssApp,
      required this.descreption});
}
