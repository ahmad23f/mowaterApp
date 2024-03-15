import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Mowater/core/constants/color.dart';

class InsuranceCategoryWidget extends StatelessWidget {
  final String image;
  IconData? icon;
  final String categoryName;
  final int id;
  final double? paddingBottom;
  final double? paddingTop;
  final double? paddingRight;
  final double? paddingLeft;

  InsuranceCategoryWidget({
    Key? key,
    this.icon,
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
      height: 208.h,
      width: 166.w,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [],
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: ColorApp.categoryColorDark,
                  blurRadius:
                      ScreenUtil().setWidth(5), // Use ScreenUtil for blurRadius
                  spreadRadius: ScreenUtil()
                      .setWidth(0.2), // Use ScreenUtil for spreadRadius
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              image, // Use the image path here
              height: 151.h,
              width: 170.w,
              fit: BoxFit.cover,
              colorBlendMode: BlendMode.darken,
            ),
          ),
          Divider(
            height: 5.h,
          ),
          Text(
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
              fontSize: ScreenUtil().setSp(16), // Use ScreenUtil for text size
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
