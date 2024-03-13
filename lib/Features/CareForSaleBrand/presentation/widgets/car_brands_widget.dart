import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mowaterApp/Features/CareForSaleBrand/data/models/carBrands/cars_model.dart';
import 'package:mowaterApp/Features/CarsForSale/data/localdata/brand_images.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/helper/reqexp.dart';
import 'package:mowaterApp/core/routing/routing_name.dart';
import 'package:mowaterApp/core/style/text_style.dart';

class CarBrandWidget extends StatelessWidget {
  CarsBrandsModel brand;
  int index;
  CarBrandWidget({super.key, required this.brand, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(RouteName.carsScreeen, extra: brand.name);
      },
      child: Padding(
        padding: EdgeInsets.all(5.dg),
        child: Container(
          width: 100.w,
          padding: EdgeInsets.only(right: 6, left: 6, top: 10.h, bottom: 0),
          decoration: BoxDecoration(
              color: ColorApp.categoryColorDark,
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(
                    color: Color.fromARGB(251, 116, 116, 116),
                    blurRadius: 1,
                    spreadRadius: 0.1),
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppRegex.extractEnglishText(brand.name),
                style: TextStyles.text_16
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 14.sp),
              ),
              Image.asset(
                BrandsImages.brandsImage()[index],
                height: 65.h,
                width: 60.w,
              )
            ],
          ),
        ),
      ),
    );
  }
}
