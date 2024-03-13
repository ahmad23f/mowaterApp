import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  String text;
  Color color;
  TextStyle textStyle;
  Widget? leading;
  EdgeInsetsGeometry? padding;
  Function()? onPressed;

  CustomButton(
      {super.key,
      this.padding,
      required this.onPressed,
      required this.color,
      required this.textStyle,
      required this.text,
      this.leading});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: color,
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: textStyle,
          ),
          leading ?? const SizedBox(),
        ],
      ),
    );
  }
}
