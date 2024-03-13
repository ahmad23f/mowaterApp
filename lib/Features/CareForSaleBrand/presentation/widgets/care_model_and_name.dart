import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/constants/size.dart';
import 'package:mowaterApp/core/style/text_style.dart';
import 'package:mowaterApp/core/widgets/warranty_icon.dart';

class CarModelAndName extends StatelessWidget {
  const CarModelAndName({
    super.key,
    required this.carName,
    required this.carModel,
  });

  final String carName;
  final String carModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Row(
                children: [
                  Text(
                    carName,
                    style: TextStyles.text_12.copyWith(fontSize: 12.sp),
                  ),
                  horizontalSpace(5.w),
                  Container(
                    height: 7.h,
                    width: 7.w,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorApp.primeryColorDark),
                  ),
                  horizontalSpace(5.w),
                  Text(
                    carModel,
                    style: TextStyles.text_12.copyWith(fontSize: 12.sp),
                  ),
                  horizontalSpace(5.w),
                  const WarrantyIcon()
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
