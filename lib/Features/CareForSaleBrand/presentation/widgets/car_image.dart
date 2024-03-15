import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Mowater/Features/CareForSaleBrand/presentation/widgets/car_image_and_carouseSlider.dart';
import 'package:Mowater/Features/CarsForSale/data/model/carModelProduct/car_image_model.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/style/text_style.dart';

class CarImageWidget extends StatelessWidget {
  const CarImageWidget({
    super.key,
    required this.images,
  });

  final List<CarImage> images;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CarImageCarouselSlider(
        car: images,
      ),
      Positioned(
          top: 0,
          right: 0,
          child: IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.white),
            onPressed: () {
              // Add your favorite icon tap logic here
            },
          )),
      Positioned(
          bottom: 0.dg,
          left: 0.5.dm,
          child: Container(
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: ColorApp.primeryColorDark,
                borderRadius: BorderRadius.circular(6)),
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  size: 20.dg,
                  Icons.photo_size_select_actual_outlined,
                ),
                horizontalSpace(5),
                Text(
                  "${images.length ?? 1}",
                  style: TextStyles.text_12.copyWith(
                    fontSize: 12.sp,
                  ),
                )
              ],
            ),
          )),
    ]);
  }
}
