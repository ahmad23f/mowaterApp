import 'package:flutter/material.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/style/text_style.dart';

class CustomTextField2 extends StatelessWidget {
  void Function(String)? onChanged;
  String label;
  TextInputType? textInputType;
  TextEditingController? controller;
  CustomTextField2(
      {super.key,
      this.onChanged,
      required this.label,
      this.textInputType,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: TextFormField(
        controller: controller,
        onChanged: (value) {
          onChanged?.call(value);
        },
        keyboardType: textInputType,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          label: Text(
            label,
            style: TextStyles.text_14.copyWith(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: ColorApp.primeryColorDark,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color:
                  ColorApp.primeryColorDark, // Change border color when focused
            ),
          ),
        ),
      ),
    );
  }
}
