import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mowaterApp/core/style/text_style.dart';

void ShowSnakBar(
  BuildContext context, {
  String? content,
  required String title,
  IconData iconData = Icons.info,
  required Color backGroundColor,
  TextStyle? subtitleTextStyle,
  TextStyle? messageTextStyle,
  int? duration,
}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    dismissDirection: DismissDirection.down,
    content: Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: title == 'Success' ? Colors.green : Colors.red,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: title == 'Success'
                    ? Colors.green.withOpacity(0.4)
                    : Colors.red,
                spreadRadius: 4,
                blurRadius: 1,
              ),
            ],
          ),
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            iconData,
            color: Colors.white,
            size: 24.dg,
          ),
        ),
        const SizedBox(width: 12.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (content != null) ...[
                Text(title,
                    style: TextStyles.text_14.copyWith(color: Colors.white)),
              ],
              const SizedBox(height: 4.0),
              Text(content!,
                  style: TextStyles.text_12.copyWith(color: Colors.white)),
            ],
          ),
        ),
      ],
    ),
    backgroundColor: backGroundColor,

    behavior: SnackBarBehavior.floating, // Show SnackBar at the top
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    duration: Duration(seconds: duration ?? 3),
  ));
}
