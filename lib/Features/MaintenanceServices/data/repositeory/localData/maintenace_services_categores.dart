import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mowaterApp/core/constants/categorys_image.dart';
import 'package:mowaterApp/core/widgets/category_widget.dart';

List<CategoryWidget> maintenaceServicesCategoryes = [
  CategoryWidget(
    height: 60,
    id: 0,
    categoryName: 'Engines',
    image: CategoryesImageName.engine,
  ),
  CategoryWidget(
    height: 70,
    id: 1,
    categoryName: 'Electrical',
    image: CategoryesImageName.electric,
  ),
  CategoryWidget(
    height: 60,
    id: 2,
    categoryName: 'Mechanical',
    image: CategoryesImageName.mekanik,
  ),
  CategoryWidget(
    height: 60,
    id: 3,
    categoryName: 'Brake',
    image: CategoryesImageName.breakCar,
  ),
  CategoryWidget(
    height: 60,
    id: 4,
    categoryName: 'AC',
    image: CategoryesImageName.ac,
  ),
  CategoryWidget(
    height: 60,
    id: 5,
    image: CategoryesImageName.gear,
    categoryName: 'Gear',
  ),
  CategoryWidget(
    id: 6,
    height: 60,
    image: CategoryesImageName.glass,
    categoryName: 'Glass',
  ),
  CategoryWidget(
    height: 60,
    id: 7,
    image: CategoryesImageName.oil,
    categoryName: 'Oil',
  ),
  CategoryWidget(
    id: 8,
    height: 60,
    image: CategoryesImageName.wheel,
    categoryName: 'Tires',
  ),
  CategoryWidget(
    id: 9,
    height: 60,
    image: CategoryesImageName.programing,
    categoryName: 'Programing',
  ),
  CategoryWidget(
    id: 10,
    height: 60.h,
    image: CategoryesImageName.dyingAndPlumbing,
    categoryName: 'Dyeing And Plumbing',
  ),
  CategoryWidget(
    id: 11,
    height: 60,
    image: CategoryesImageName.exhaustandfilter,
    categoryName: 'Rediators And Exhaust',
  ),
];
