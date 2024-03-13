import 'package:flutter/material.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/style/text_style.dart';

class PriceFormField extends StatelessWidget {
  TextEditingController? price;
  void Function(String)? onChanged;
  TextEditingController? controller;
  PriceFormField({super.key, this.onChanged, this.price, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: (value) {
        onChanged?.call(value);
      },
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        label: Text(
          'Price',
          style: TextStyles.text_14.copyWith(color: Colors.white),
        ),
        prefix: const Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: Text('AED'),
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
    );
  }
}
