import 'package:flutter/material.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/style/text_style.dart';

class KiloMetersTextForm extends StatelessWidget {
  TextEditingController? textEditingController;
  KiloMetersTextForm({super.key, this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        label: Text(
          'Kilometer',
          style: TextStyles.text_14.copyWith(color: Colors.white),
        ),
        prefixIcon: const Icon(Icons.speed),
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
