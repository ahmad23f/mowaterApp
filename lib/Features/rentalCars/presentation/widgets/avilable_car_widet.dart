import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Mowater/Features/CareForSaleBrand/presentation/widgets/car_image.dart';
import 'package:Mowater/Features/rentalCars/models/rental_cars_model.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/helper/reqexp.dart';
import 'package:Mowater/core/style/text_style.dart';

class AvilableCarWidget extends StatelessWidget {
  RentCarModel car;
  AvilableCarWidget({
    required this.car,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 200.w,
        margin: const EdgeInsets.symmetric(horizontal: mainPadding),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CarImageWidget(images: car.images)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'AED ',
                        style: TextStyles.text_10.copyWith(
                            color: ColorApp.primeryColorDark,
                            shadows: [
                              BoxShadow(
                                  color: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .color!,
                                  spreadRadius: 20,
                                  blurRadius: 10)
                            ]),
                      ),
                      Text(
                        car.dailyPrice.toString(),
                        style: TextStyles.text_14,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: ColorApp.primeryColorDark,
                        size: 15,
                      ),
                      Text(
                        car.monthlyPrice,
                        style: TextStyles.text_10.copyWith(
                          fontSize: 10.sp,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        AppRegex.extractEnglishText(
                          car.carMake,
                        ),
                        style: TextStyles.text_12,
                      ),
                      Text(
                        " - ${car.carModel}",
                        style: TextStyles.text_12,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month_outlined,
                        size: 15,
                        color: ColorApp.primeryColorDark,
                      ),
                      Text(
                        car.year.toString(),
                        style: TextStyles.text_14,
                      ),
                    ],
                  ),
                  // car.i == 0
                  //     ? Text(
                  //         calculateTimeDifference(car.createdAt),
                  //         style: TextStyles.text_10,
                  //       )
                  //     : const PremiumWidget()
                ],
              ),
            ),
          ],
        ));
  }
}
