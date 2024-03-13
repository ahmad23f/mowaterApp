import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mowaterApp/Features/fuel/models/fuel_model.dart';
import 'package:mowaterApp/core/constants/size.dart';
import 'package:mowaterApp/core/style/text_style.dart';

class FuelPriceForCarModelWidget extends StatelessWidget {
  FuelPrice fuel;
  Color color;
  String price;
  FuelPriceForCarModelWidget({
    Key? key,
    required this.fuel,
    required this.color,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.h),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
      height: 120.h,
      width: mediasize(context).width,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  fuel.fuelType,
                  style: TextStyles.text_18.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                      color: Colors.white,
                      shadows: [
                        const Shadow(color: Colors.white, blurRadius: 0.7)
                      ]),
                ),
                Icon(
                  Icons.local_gas_station_rounded,
                  size: 80.dg,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(right: 12.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  price != 'select car To See Price'
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              (double.parse(price) * fuel.price)
                                  .toStringAsFixed(2),
                              style: TextStyles.text_26
                                  .copyWith(color: Colors.white),
                            ),
                            Text(
                              'AED',
                              style: TextStyles.text_10.copyWith(
                                  color: Colors.white, fontSize: 10.sp),
                            )
                          ],
                        )
                      : Text(
                          price,
                          style: TextStyles.text_10,
                        ),
                  Text(
                    "Full Tank",
                    style: TextStyles.text_20.copyWith(color: Colors.white),
                  )
                ],
              ),
            )
          ]),
    );
  }
}
