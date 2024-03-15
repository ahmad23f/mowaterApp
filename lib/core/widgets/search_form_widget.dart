import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/style/text_style.dart';

class ModernSearchContainer extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final Function? onSearch;
  void Function(String)? onChange;
  Widget? widget;
  TextInputType? keyboardType;
  ModernSearchContainer({
    Key? key,
    required this.controller,
    this.onChange,
    required this.hintText,
    required this.icon,
    this.onSearch,
    this.widget,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(71, 0, 0, 0),
            spreadRadius: 0.01,
            blurRadius: 6,
          )
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              keyboardType: keyboardType,
              onChanged: onChange,
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyles.text_14.copyWith(
                  fontSize: 14.sp,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          widget ??
              IconButton(
                icon: Icon(icon),
                onPressed: () {},
                color: Colors.grey[600],
              ),
        ],
      ),
    );
  }
}
