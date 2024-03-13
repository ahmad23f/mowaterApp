import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/style/text_style.dart';

class PlateCodeWidget extends StatelessWidget {
  final String image;
  final String categoryName;
  final int id;
  final double? paddingBottom;
  final double? paddingTop;
  final double? paddingRight;
  final double? paddingLeft;

  const PlateCodeWidget({
    Key? key,
    required this.id,
    required this.image,
    required this.categoryName,
    this.paddingBottom,
    this.paddingLeft,
    this.paddingRight,
    this.paddingTop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [],
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: ScreenUtil().setWidth(120), // Use ScreenUtil for width
              height: ScreenUtil().setHeight(70), // Use ScreenUtil for height
              decoration: BoxDecoration(
                color: ColorApp.secunderyColorDark,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: ColorApp.categoryColorDark,
                    blurRadius: ScreenUtil()
                        .setWidth(5), // Use ScreenUtil for blurRadius
                    spreadRadius: ScreenUtil()
                        .setWidth(0.2), // Use ScreenUtil for spreadRadius
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 10.h,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                height: 75.h,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 5),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        image, // Use the image path here
                        height: 40.h,
                        width: 60.w,
                        colorBlendMode: BlendMode.darken,
                      ),
                    ),
                    Text('00000',
                        style: TextStyles.text_14.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -5.h,
            left: ScreenUtil().setWidth(1), // Use ScreenUtil for left position
            right:
                ScreenUtil().setWidth(1), // Use ScreenUtil for right position
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical:
                      ScreenUtil().setHeight(8)), // Use ScreenUtil for padding
              child: Text(
                categoryName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  shadows: [
                    BoxShadow(
                      color: const Color.fromARGB(74, 123, 123, 123),
                      blurRadius: ScreenUtil()
                          .setWidth(20), // Use ScreenUtil for blurRadius
                      spreadRadius: ScreenUtil()
                          .setWidth(0.1), // Use ScreenUtil for spreadRadius
                    ),
                  ],
                  fontSize:
                      ScreenUtil().setSp(14), // Use ScreenUtil for text size
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
