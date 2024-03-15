import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Mowater/core/constants/color.dart';

class FilterIcon extends StatelessWidget {
  void Function()? onPressed;

  FilterIcon({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 60.w,
        height: 48.h,
        decoration: BoxDecoration(
            color: ColorApp.primeryColorDark,
            borderRadius: BorderRadius.circular(6)),
        child: IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.filter_list_rounded,
            color: Colors.white,
          ),
        ));
  }
}
