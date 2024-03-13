import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mowaterApp/Features/CarsForSale/data/model/carModelProduct/car_model_product.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/helper/get_post_when.dart';
import 'package:mowaterApp/core/style/text_style.dart';

class CarPriceWithPremium extends StatelessWidget {
  CarProduct carModel;
  CarPriceWithPremium({
    required this.carModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              "${carModel.price}",
              style: TextStyles.text_18
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 18.sp),
            ),
            Text(
              " AED",
              style: TextStyles.text_12.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                  color: ColorApp.primeryColorDark,
                  shadows: [
                    const Shadow(
                        color: Color.fromARGB(255, 3, 2, 2), blurRadius: 20)
                  ]),
            ),
          ],
        ),
        carModel.isAds == 0
            ? Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ColorApp.primeryColorDark,
                ),
                child: Text(
                  'PREMIUM',
                  style: TextStyles.text_12.copyWith(
                    color: Colors.white,
                    fontSize: 12.sp,
                  ),
                ))
            : Text(
                calculateTimeDifference(carModel.createdAt.toString()),
                style: TextStyles.text_12.copyWith(fontSize: 12.sp),
              )
      ],
    );
  }
}
