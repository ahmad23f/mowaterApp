import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Mowater/core/style/text_style.dart';

class CarLocationWidget extends StatelessWidget {
  final String location;

  const CarLocationWidget({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.location_on_outlined,
          size: 15.dg,
        ),
        SizedBox(
          width: 100.w,
          child: Text(
            location,
            style: TextStyles.text_12.copyWith(fontSize: 12),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
