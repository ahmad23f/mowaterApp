import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mowaterApp/core/constants/size.dart';
import 'package:mowaterApp/core/style/text_style.dart';

class DetailsRow extends StatelessWidget {
  String text;
  String value;
  DetailsRow({super.key, required this.text, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text,
                style: TextStyles.text_14.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                )),
            horizontalSpace(20),
            Text(
              value,
              style: TextStyles.text_16
                  .copyWith(fontWeight: FontWeight.w700, fontSize: 16.sp),
            ),
          ],
        ),
        Divider(
          height: 15.h,
          thickness: 0.4,
        ),
      ],
    );
  }
}
