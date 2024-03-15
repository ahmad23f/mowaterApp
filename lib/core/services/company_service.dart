import 'package:hive/hive.dart';
import 'package:Mowater/core/services/company_model.dart';

class NormalCompanyService {
  static Box<NormalCompanyModelHive>? _box;

  static Future<Box<NormalCompanyModelHive>> _openBox() async {
    if (_box == null || !_box!.isOpen) {
      _box = await Hive.openBox<NormalCompanyModelHive>('NormalCompany');
    }
    return _box!;
  }

  static Future<void> saveCompanyData(
      NormalCompanyModelHive companyData) async {
    final box = await _openBox();
    final company = NormalCompanyModelHive(
      id: companyData.id,
      name: companyData.name,
      weekdayWork: companyData.weekdayWork,
      startTime: companyData.startTime,
      endTime: companyData.endTime,
      specialty: companyData.specialty,
      description: companyData.description,
      location: companyData.location,
      phoneNumber: companyData.phoneNumber,
      whatsappNumber: companyData.whatsappNumber,
      image: companyData.image,
      categoryName: companyData.categoryName,
      carBrands: companyData.carBrands,
      approval: companyData.approval,
      mowaterDiscount: companyData.mowaterDiscount,
      carMakes: companyData.carMakes,
      latitude: companyData.latitude,
      longitude: companyData.longitude,
      companyImage: companyData.companyImage,
      companyToken: companyData.companyToken,
      companyType: companyData.companyType,
    );
    await box.put('company', company);
  }

  static Future<void> deleteCompanyData() async {
    final box = await _openBox();
    await box.delete('company');
  }

  static NormalCompanyModelHive getCompanyData() {
    final box = Hive.box<NormalCompanyModelHive>('NormalCompany');
    final company = box.get('company');
    return company!;
  }

  static bool hasCompanyData() {
    final box = Hive.box<NormalCompanyModelHive>('NormalCompany');
    return box.containsKey('company');
  }

  static Future<void> updateCompanyData(
      NormalCompanyModelHive updatedData) async {
    final box = await _openBox();
    final storedData = box.get('company');

    if (storedData != null) {
      if (updatedData.id != null) {
        storedData.id = updatedData.id;
      }
      if (updatedData.name != null && updatedData.name!.isNotEmpty) {
        storedData.name = updatedData.name;
      }
      if (updatedData.weekdayWork != null &&
          updatedData.weekdayWork!.isNotEmpty) {
        storedData.weekdayWork = updatedData.weekdayWork;
      }
      if (updatedData.startTime != null && updatedData.startTime!.isNotEmpty) {
        storedData.startTime = updatedData.startTime;
      }
      if (updatedData.endTime != null && updatedData.endTime!.isNotEmpty) {
        storedData.endTime = updatedData.endTime;
      }
      if (updatedData.specialty != null && updatedData.specialty!.isNotEmpty) {
        storedData.specialty = updatedData.specialty;
      }
      if (updatedData.description != null &&
          updatedData.description!.isNotEmpty) {
        storedData.description = updatedData.description;
      }
      if (updatedData.location != null && updatedData.location!.isNotEmpty) {
        storedData.location = updatedData.location;
      }
      if (updatedData.phoneNumber != null &&
          updatedData.phoneNumber!.isNotEmpty) {
        storedData.phoneNumber = updatedData.phoneNumber;
      }
      if (updatedData.whatsappNumber != null &&
          updatedData.whatsappNumber!.isNotEmpty) {
        storedData.whatsappNumber = updatedData.whatsappNumber;
      }
      if (updatedData.image != null && updatedData.image!.isNotEmpty) {
        storedData.image = updatedData.image;
      }
      if (updatedData.categoryName != null &&
          updatedData.categoryName!.isNotEmpty) {
        storedData.categoryName = updatedData.categoryName;
      }
      if (updatedData.carBrands != null && updatedData.carBrands!.isNotEmpty) {
        storedData.carBrands = updatedData.carBrands;
      }
      if (updatedData.approval != null) {
        storedData.approval = updatedData.approval;
      }
      if (updatedData.mowaterDiscount != null) {
        storedData.mowaterDiscount = updatedData.mowaterDiscount;
      }
      if (updatedData.carMakes != null && updatedData.carMakes!.isNotEmpty) {
        storedData.carMakes = updatedData.carMakes;
      }
      if (updatedData.latitude != null && updatedData.latitude!.isNotEmpty) {
        storedData.latitude = updatedData.latitude;
      }
      if (updatedData.longitude != null && updatedData.longitude!.isNotEmpty) {
        storedData.longitude = updatedData.longitude;
      }

      await box.put('company', storedData);
    }
  }

  static Future<void> closeBox() async {
    if (_box != null && _box!.isOpen) {
      await _box!.close();
      _box = null;
    }
  }
}
