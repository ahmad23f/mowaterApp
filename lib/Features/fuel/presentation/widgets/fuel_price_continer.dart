import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Mowater/core/style/text_style.dart';

class FuelPriceTodayWidget extends StatelessWidget {
  Color color;
  String title;
  double price;
  FuelPriceTodayWidget({
    Key? key,
    required this.color,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 2.w),
        padding: EdgeInsets.all(20.dg),
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(6)),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyles.text_18.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  price.toString(),
                  style: TextStyles.text_16.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  'AED',
                  style: TextStyles.text_10
                      .copyWith(color: Colors.white, fontSize: 10.sp),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
