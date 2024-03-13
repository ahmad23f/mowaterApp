import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mowaterApp/core/constants/color.dart';

class WarrantyIcon extends StatelessWidget {
  const WarrantyIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'There is a guarantee',
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(
            Icons.shield,
            color: ColorApp.primeryColorDark,
            size: 16.dg, // Customize the shield size as needed
          ),
          Positioned(
            child: Icon(
              Icons.check,
              color: Colors.white,
              size: 10.dg, // Customize the checkmark size as needed
            ),
          ),
        ],
      ),
    );
  }
}
