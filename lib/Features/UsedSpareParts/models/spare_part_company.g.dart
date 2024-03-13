// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spare_part_company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpatepartsCompanyModel _$SpatepartsCompanyModelFromJson(
        Map<String, dynamic> json) =>
    SpatepartsCompanyModel(
      companyId: json['id'] as int,
      location: json['location'] as String,
      companyImage: json['company_image'] as String,
      name: json['name'] as String,
      startTime: json['start_time'] as String,
      endTime: json['end_time'] as String,
      phoneNumber: json['phoneNumber'] as String,
      whatsAppNumber: json['whatsAppNumber'] as String,
      daysWeek: (json['weekday_work'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      createAccountAt: json['createAccountAt'] as String,
      mowaterDiscount: json['mowaterDiscount'] as int,
      carBrandNames: (json['car_brand_names'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      products: (json['products'] as List<dynamic>)
          .map((e) => SparePartProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SpatepartsCompanyModelToJson(
        SpatepartsCompanyModel instance) =>
    <String, dynamic>{
      'id': instance.companyId,
      'company_image': instance.companyImage,
      'name': instance.name,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'phoneNumber': instance.phoneNumber,
      'whatsAppNumber': instance.whatsAppNumber,
      'weekday_work': instance.daysWeek,
      'createAccountAt': instance.createAccountAt,
      'location': instance.location,
      'mowaterDiscount': instance.mowaterDiscount,
      'car_brand_names': instance.carBrandNames,
      'products': instance.products,
    };

SparePartProduct _$SparePartProductFromJson(Map<String, dynamic> json) =>
    SparePartProduct(
      productId: json['productId'] as int,
      image: json['image'] as String,
      productName: json['productName'] as String,
      productPrice: json['productPrice'] as String,
      state: json['productState'] as int,
      categoryId: json['categoryId'] as int,
      categoryName: json['category_name'] as String,
    );

Map<String, dynamic> _$SparePartProductToJson(SparePartProduct instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'productName': instance.productName,
      'productPrice': instance.productPrice,
      'image': instance.image,
      'productState': instance.state,
      'categoryId': instance.categoryId,
      'category_name': instance.categoryName,
    };
