import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mowaterApp/Features/CareForSaleBrand/presentation/widgets/car_location.dart';
import 'package:mowaterApp/Features/CarsForSale/data/model/carModelProduct/car_model_product.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/constants/size.dart';
import 'package:mowaterApp/core/style/text_style.dart';

class CarPrimeryDetails extends StatelessWidget {
  final CarProduct carModel;

  const CarPrimeryDetails({Key? key, required this.carModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CarLocationWidget(
            location: carModel.location,
          ),
        ),
        SizedBox(
          height: 10.h,
          width: 20.w,
          child: VerticalDivider(
            color: ColorApp.categoryColorDark,
            thickness: 1,
          ),
        ),
        SizedBox(
          width: 120.w,
          child: Row(
            children: [
              Icon(Icons.speed, size: 15.dg),
              horizontalSpace(5),
              Flexible(
                child: Text(
                  "${carModel.kilometer.toString()} km",
                  style: TextStyles.text_12.copyWith(fontSize: 12.sp),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
          width: 10.w,
          child: const VerticalDivider(
            color: Colors.black,
            thickness: 1,
          ),
        ),
        SizedBox(
          width: 70.w,
          child: Row(
            children: [
              Icon(Icons.date_range_outlined, size: 15.dg),
              horizontalSpace(5.dg),
              Text(
                carModel.year.toString(),
                style: TextStyles.text_12.copyWith(fontSize: 12.sp),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
