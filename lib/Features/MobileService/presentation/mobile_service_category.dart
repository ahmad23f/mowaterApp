import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/routing/routing_name.dart';
import 'package:Mowater/core/services/ads_widget.dart';
import 'package:Mowater/core/style/text_style.dart';
import 'package:Mowater/core/widgets/category_widget.dart';

class MobileServiceCategoryScreen extends StatelessWidget {
  const MobileServiceCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mobile Service",
          style: TextStyles.text_18.copyWith(fontSize: 18.sp),
        ),
      ),
      body: Column(
        children: [
          const AdsContienr(),
          GridView.builder(
            itemCount: mobileServiceCategoryList.length,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crorAxixCount(context)),
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    context.push(RouteName.mobileService, extra: {
                      "categoryName":
                          mobileServiceCategoryList[index].categoryName,
                      'id': mobileServiceCategoryList[index].id
                    });
                  },
                  child: mobileServiceCategoryList[index]);
            },
          )
        ],
      ),
    );
  }
}

List<CategoryWidget> mobileServiceCategoryList = [
  CategoryWidget(
      paddingTop: 20.h,
      height: 60.h,
      id: 1,
      image: 'assets/mobileService/charging.png',
      categoryName: 'Charging & Replacing Battery'),
  CategoryWidget(
      paddingTop: 20.h,
      height: 60.h,
      id: 2,
      image: 'assets/mobileService/wash.png',
      categoryName: 'Car Wash'),
  CategoryWidget(
      paddingTop: 20.h,
      height: 50.h,
      id: 3,
      image: 'assets/mobileService/car_maintenance.png',
      categoryName: 'Car Maintenance'),
  CategoryWidget(
      paddingTop: 20.h,
      height: 60.h,
      id: 4,
      image: 'assets/mobileService/oil_change.png',
      categoryName: 'Oil Change'),
  CategoryWidget(
      paddingTop: 20.h,
      height: 60,
      id: 5,
      image: 'assets/carCare/shading.png',
      categoryName: 'Glass Shading'),
  CategoryWidget(
      paddingTop: 20.h,
      height: 60.h,
      id: 6,
      image: 'assets/mobileService/charging_replace.png',
      categoryName: 'Charging & Replacing Tyres'),
];
