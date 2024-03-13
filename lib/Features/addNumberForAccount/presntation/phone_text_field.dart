import 'package:flutter/material.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/style/text_style.dart';

class PhoneNumberFormField extends StatelessWidget {
  final TextEditingController controller;

  const PhoneNumberFormField({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
          prefixIcon: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '+971',
                style: TextStyles.text_14
                    .copyWith(color: ColorApp.primeryColorDark),
              ),
            ],
          ),
          hintText: '0 00 00 00 00',
          hintStyle: const TextStyle(color: Colors.white),
          border: const UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromARGB(255, 219, 219, 219), width: 0.3)),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromARGB(255, 219, 219, 219), width: 0.3)),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromARGB(255, 219, 219, 219), width: 0.3))),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your phone number';
        } else if (value.length < 10 || value.length > 10) {
          return 'Please enter valid phone number';
        }
        // You can add more validation if needed
        return null;
      },
    );
  }
}
