import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/style/text_style.dart';

class WhatsaapForm extends StatelessWidget {
  TextEditingController? textEditingController;
  WhatsaapForm({
    this.textEditingController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        label: Text(
          'whatsapp',
          style: TextStyles.text_14.copyWith(color: Colors.white),
        ),
        prefixIcon: const Icon(FontAwesomeIcons.whatsapp),
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
