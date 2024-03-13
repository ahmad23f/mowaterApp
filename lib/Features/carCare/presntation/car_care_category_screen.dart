import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mowaterApp/core/constants/size.dart';
import 'package:mowaterApp/core/routing/routing_name.dart';
import 'package:mowaterApp/core/services/ads_widget.dart';
import 'package:mowaterApp/core/style/text_style.dart';
import 'package:mowaterApp/core/widgets/category_widget.dart';

class CarCareCategorysScreen extends StatelessWidget {
  const CarCareCategorysScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Car Care',
          style: TextStyles.text_18.copyWith(fontSize: 18.sp),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AdsContienr(),
            const Divider(
              height: 20,
              indent: 20,
              endIndent: 20,
            ),
            GridView.builder(
              itemCount: carCareCategory.length,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: mainPadding,
                  crossAxisSpacing: mainPadding,
                  crossAxisCount: crorAxixCount(context)),
              itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    context.push(RouteName.carCareCategorys, extra: {
                      "id": carCareCategory[index].id,
                      'categoryName': carCareCategory[index].categoryName
                    });
                  },
                  child: carCareCategory[index]),
            )
          ],
        ),
      ),
    );
  }
}

List<CategoryWidget> carCareCategory = [
  CategoryWidget(
      paddingTop: 10.h,
      height: 70.h,
      id: 1,
      image: 'assets/carCare/shading.png',
      categoryName: 'Glass Shading'),
  CategoryWidget(
      paddingTop: 10.h,
      height: 60.h,
      id: 2,
      image: 'assets/carCare/polish.png',
      categoryName: 'Car Polish'),
  CategoryWidget(
      paddingTop: 10.h,
      paddingRight: 10.w,
      height: 50.h,
      id: 2,
      image: 'assets/carCare/car_wash.png',
      categoryName: 'Car Wash'),
  CategoryWidget(
      paddingTop: 10.h,
      height: 80.h,
      id: 2,
      image: 'assets/carCare/Accessories.png',
      categoryName: 'Accessories'),
  CategoryWidget(
      height: 60.h,
      paddingTop: 10.h,
      id: 2,
      image: 'assets/carCare/wrapping.png',
      categoryName: 'Car Wraps'),
  CategoryWidget(
      paddingRight: 10.w,
      paddingTop: 20.h,
      height: 60.h,
      id: 2,
      image: 'assets/carCare/keys_and_remotes.png',
      categoryName: 'Keys & Remotes'),
  CategoryWidget(
      paddingTop: 10.h,
      height: 60.h,
      id: 2,
      image: 'assets/carCare/interior_washing.png',
      categoryName: 'Interior Washing'),
  CategoryWidget(
      height: 80.h,
      id: 2,
      image: 'assets/carCare/upholstery.png',
      categoryName: 'Car Upholstery'),
  CategoryWidget(
      paddingTop: 10.h,
      height: 60.h,
      id: 2,
      image: 'assets/carCare/lights_polishing.png',
      categoryName: 'Lights Polishing'),
  CategoryWidget(
      height: 90.h,
      id: 2,
      image: 'assets/carCare/engine_protection.png',
      categoryName: 'Engine Protection'),
  CategoryWidget(
      paddingTop: 10.h,
      height: 60.h,
      id: 2,
      image: 'assets/carCare/body_protection.png',
      categoryName: 'Car Body Protections'),
  CategoryWidget(
      paddingTop: 15.h,
      height: 50.h,
      id: 2,
      image: 'assets/carCare/paint_protection.png',
      categoryName: 'Paint Protection'),
];
