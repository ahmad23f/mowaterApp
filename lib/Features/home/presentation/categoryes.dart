import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Mowater/core/constants/categorys_image.dart';
import 'package:Mowater/core/widgets/category_widget.dart';

List<Widget> categorysList = [
  CategoryWidget(
    height: 80.h,
    image: CategoryesImageName.mart,
    categoryName: 'Mowater Mart'.tr(),
    paddingBottom: 20.h,
    id: 1,
  ),
  CategoryWidget(
    image: CategoryesImageName.maintenance,
    categoryName: 'Maintenance'.tr(),
    height: 80.h,
    id: 2,
  ),
  CategoryWidget(
    image: CategoryesImageName.parking,
    categoryName: 'Parking'.tr(),
    height: 80.h,
    paddingBottom: 40.dg,
    id: 3,
  ),
  CategoryWidget(
    image: CategoryesImageName.carEvaluation,
    categoryName: 'Evaluation'.tr(),
    height: 80.h,
    id: 4,
  ),
  CategoryWidget(
    image: CategoryesImageName.showYourCar,
    categoryName: 'Sell Your Car'.tr(),
    height: 55.h,
    paddingTop: 10.h,
    id: 5,
  ),
  CategoryWidget(
    image: CategoryesImageName.forSale,
    categoryName: 'For Sale'.tr(),
    height: 70.h,
    paddingTop: 10.h,
    id: 6,
  ),
  CategoryWidget(
    image: CategoryesImageName.showRoom,
    categoryName: 'Showrooms'.tr(),
    height: 70.h,
    id: 7,
  ),
  CategoryWidget(
    image: CategoryesImageName.inurance,
    categoryName: 'Insurance'.tr(),
    height: 80.h,
    id: 8,
  ),
  CategoryWidget(
    image: CategoryesImageName.forRend,
    categoryName: 'Rental Cars'.tr(),
    height: 80.h,
    id: 9,
  ),
  CategoryWidget(
    image: CategoryesImageName.warrantry,
    categoryName: 'Warranty'.tr(),
    height: 80.h,
    paddingRight: 10.w,
    id: 10,
  ),
  CategoryWidget(
    image: CategoryesImageName.spareParts,
    categoryName: 'Spare Parts'.tr(),
    height: 50.h,
    paddingTop: 10.h,
    id: 11,
  ),
  CategoryWidget(
    image: CategoryesImageName.rating,
    categoryName: 'Inspection'.tr(),
    height: 80.h,
    id: 12,
  ),
  CategoryWidget(
    image: CategoryesImageName.carCare,
    categoryName: 'Car Care'.tr(),
    height: 80.h.h,
    id: 13,
  ),
  CategoryWidget(
    image: CategoryesImageName.carNumber,
    categoryName: 'Car Numbers'.tr(),
    height: 80.h,
    paddingTop: 10.h,
    paddingLeft: 5.w,
    paddingRight: 5.w,
    id: 14,
  ),
  CategoryWidget(
    image: CategoryesImageName.mobileService,
    categoryName: 'Mobile Service'.tr(),
    height: 80.h,
    id: 15,
  ),
];
