import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/constants/size.dart';
import 'package:mowaterApp/core/style/text_style.dart';

class ContactIconWithName extends StatelessWidget {
  String name;
  Color? color;
  IconData? icon;
  void Function()? onTap;
  Color? backGroundColor;
  ContactIconWithName(
      {Key? key,
      required this.name,
      this.color,
      required this.icon,
      this.backGroundColor,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(5.dg),
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: ColorApp.primeryColorDark,
              )),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(icon, size: 25.dm, color: color ?? ColorApp.primeryColorDark),
            horizontalSpace(5.w),
            Text(
              name,
              style: TextStyles.text_14.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                  color: Colors.white),
            )
          ]),
        ),
      ),
    );
  }
}
