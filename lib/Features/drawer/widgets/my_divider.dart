import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Mowater/core/constants/color.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Color dividerColor = Theme.of(context).colorScheme.secondary;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Divider(
        color: dividerColor,
        thickness: 2.0,
        indent: 20.0,
      ),
    );
  }
}
