import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/style/text_style.dart';

class AbuDhabiParkingType extends StatefulWidget {
  void Function()? onTap;
  String typeName;
  String selectedType;
  BorderRadiusGeometry borderRadius;
  AbuDhabiParkingType(
      {super.key,
      required this.onTap,
      required this.typeName,
      required this.selectedType,
      required this.borderRadius});
  @override
  State<AbuDhabiParkingType> createState() => _AbuDhabiParkingTypeState();
}

class _AbuDhabiParkingTypeState extends State<AbuDhabiParkingType> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        return widget.onTap!.call();
      },
      child: AnimatedContainer(
        decoration: BoxDecoration(
            color: widget.selectedType == widget.typeName
                ? ColorApp.primeryColorDark
                : Colors.transparent,
            borderRadius: widget.borderRadius),
        duration: const Duration(milliseconds: 200),
        height: 60.h,
        width: 245.w / 2,
        child: Center(
          child: Text(
              textAlign: TextAlign.center,
              widget.typeName,
              style: TextStyles.text_20),
        ),
      ),
    );
  }
}
