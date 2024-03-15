import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Mowater/core/constants/color.dart';

class CategoryWidget extends StatelessWidget {
  final String image;
  IconData? icon;
  final String categoryName;
  final int id;
  final double height;
  final double? paddingBottom;
  final double? paddingTop;
  final double? paddingRight;
  final double? paddingLeft;

  CategoryWidget({
    Key? key,
    this.icon,
    required this.height,
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
              width: ScreenUtil().setWidth(110), // Use ScreenUtil for width
              height: ScreenUtil().setHeight(80), // Use ScreenUtil for height
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
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
          icon == null
              ? Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: paddingBottom ?? 0,
                      top: paddingTop ?? 0,
                      right: paddingRight ?? 0,
                      left: paddingLeft ?? 0,
                    ),
                    child: Image.asset(
                      image, // Use the image path here
                      height: height,
                      colorBlendMode: BlendMode.darken,
                    ),
                  ),
                )
              : Icon(icon),
          Positioned(
            bottom: 0,
            left: ScreenUtil().setWidth(1), // Use ScreenUtil for left position
            right:
                ScreenUtil().setWidth(1), // Use ScreenUtil for right position
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(5),
                  vertical:
                      ScreenUtil().setHeight(8)), // Use ScreenUtil for padding
              child: Text(
                categoryName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1,
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
                      ScreenUtil().setSp(16), // Use ScreenUtil for text size
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
