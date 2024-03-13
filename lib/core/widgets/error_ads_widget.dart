import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/constants/size.dart';

class ErrorAdsWidgte extends StatelessWidget {
  const ErrorAdsWidgte({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      width: mediasize(context).width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: ColorApp.secunderyColorDark),
      child: Image.asset('assets/images/logo.png'),
    );
  }
}
