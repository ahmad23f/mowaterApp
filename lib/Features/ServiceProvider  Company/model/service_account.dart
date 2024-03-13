// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

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
  final String? carMakes;
  bool? mowaterDiscount;
  int? providerTypeInsurance;
  ServiceProviderAccountModel({
    this.image,
    this.tradeName,
    this.commercialLicenseNumber,
    this.selectedSpecialties,
    this.selectedDays,
    this.startTime,
    this.endTime,
    this.latitude,
    this.longitude,
    this.pdfFile,
    this.password,
    this.specialtyName,
    this.whatssApp,
    this.number,
    this.descreption,
    this.carMakes,
    this.mowaterDiscount,
    this.providerTypeInsurance,
  });
}
