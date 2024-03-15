import 'dart:io';

import 'package:flutter/material.dart';
import 'package:Mowater/Features/signUp/presentation/widget/register_link.dart';
import 'package:Mowater/Features/signUp/presentation/widget/sing_up_buttn.dart';
import 'package:Mowater/core/helper/validator.dart';
import 'package:Mowater/core/widgets/text_form_fiedl.dart';

Widget loginUserForm(BuildContext context) {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmpassword = TextEditingController();
  final TextEditingController name = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  String image = '';

  return Form(
    key: formKey,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextFormField(
          controller: email,
          hintText: 'Email Address',
          inputType: TextInputType.text,
          validator: (value) {
            return emailValidator(value!);
          },
        ),
        CustomTextFormField(
          isPasswordField: true,
          controller: password,
          hintText: 'Password',
          validator: (value) {
            return passwordValidator(value!);
          },
        ),
        CustomTextFormField(
          isPasswordField: true,
          controller: confirmpassword,
          hintText: 'Confirm Password',
          validator: (value) {
            if (password.text != confirmpassword.text) {
              return 'Not The Seem Passwrod';
            }
            return passwordValidator(value!);
          },
        ),
        const SizedBox(height: 20),
        signUpUserButton(
            context, formKey, email, image, password, confirmpassword, name),
        const SizedBox(height: 20),
        registerUserLink(context),
      ],
    ),
  );
}
