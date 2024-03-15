import 'package:flutter/material.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/style/text_style.dart';

class CallPhoneNumber extends StatelessWidget {
  TextEditingController? textEditingController;

  CallPhoneNumber({
    this.textEditingController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {},
      controller: textEditingController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        label: Text(
          'Phone Number',
          style: TextStyles.text_14.copyWith(color: Colors.white),
        ),
        prefixIcon: const Icon(Icons.phone),
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
