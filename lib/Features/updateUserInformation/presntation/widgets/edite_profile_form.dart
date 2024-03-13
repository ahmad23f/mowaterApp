import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mowaterApp/Features/signUp/data/models/user_response.dart';
import 'package:mowaterApp/Features/updateUserInformation/presntation/cubit/update_user_info_cubit.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/constants/size.dart';
import 'package:mowaterApp/core/routing/routing_name.dart';
import 'package:mowaterApp/core/services/user_model.dart';
import 'package:mowaterApp/core/services/user_state.dart';
import 'package:mowaterApp/core/style/text_style.dart';
import 'package:mowaterApp/core/widgets/animation_loading_button.dart';
import 'package:mowaterApp/core/widgets/text_form_fiedl.dart';

class EditProfileForm extends StatefulWidget {
  File? image;
  EditProfileForm({super.key, required this.image});

  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  late User user;
  late TextEditingController nickName,
      userName,
      email,
      phoneNumber,
      whatsAppNumber,
      password,
      confirmPassword;
  @override
  void initState() {
    user = UserServices.getUserInformation();
    nickName = TextEditingController(text: user.nickName);
    userName = TextEditingController(text: user.username);
    email = TextEditingController(text: user.email);
    phoneNumber = TextEditingController(text: user.phoneNumber);
    password = TextEditingController(text: user.password);
    whatsAppNumber = TextEditingController(text: user.whatsappNumber);
    confirmPassword = TextEditingController();
    super.initState();
  }

  // Function to calculate the time difference in days
  int calculateTimeDifference(String lastUpdate) {
    DateTime lastUpdateTime = DateTime.parse(lastUpdate);
    DateTime now = DateTime.now();
    Duration difference = now.difference(lastUpdateTime);
    return difference.inDays;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0.w),
                    child: Text(
                      'Nick Name',
                      style: TextStyles.text_12,
                    ),
                  ),
                  CustomTextFormField(
                    hintText: 'Nick Name',
                    controller: nickName,
                    label: '',
                  ),
                ],
              ),
            ),
            horizontalSpace(10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0.w),
                    child: Text(
                      'Full Name',
                      style: TextStyles.text_12,
                    ),
                  ),
                  CustomTextFormField(
                    hintText: 'Full Name',
                    controller: userName,
                    label: 'name',
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 8.0.w),
          child: Text(
            'Phone Number',
            style: TextStyles.text_12,
          ),
        ),
        _editNumber(
            numberStaet: user.verify ?? 0,
            context: context,
            numberType: 'Phone Number',
            phoneNumber: phoneNumber,
            lastupdate: user.lastUpdatePhoneNumber ?? DateTime(2020),
            user: user),
        verticalSpace(15.h),
        Padding(
          padding: EdgeInsets.only(left: 8.0.w),
          child: Text(
            'WhatsApp Number',
            style: TextStyles.text_12,
          ),
        ),
        _editNumber(
            numberStaet: user.whatsState ?? 0,
            context: context,
            numberType: 'WhatsApp Number',
            phoneNumber: whatsAppNumber,
            lastupdate: user.lastUpdateWhatsAppNumber ?? DateTime(2020),
            user: user),
        verticalSpace(15.h),
        Center(
          child: LoadingButton(
            buttonText: 'Save',
            isLoading: context.read<UpdateUserInfoCubit>().isLoading,
            onPressed: () async {
              setState(() {});
              await context.read<UpdateUserInfoCubit>().update(
                  user: UserModel(
                      userType: UserServices.getUserInformation().userType,
                      nickname: nickName.text,
                      name: userName.text,
                      image: widget.image?.path,
                      id: user.id),
                  file: widget.image);

              context.push(RouteName.home);
            },
          ),
        ),
      ],
    );
  }
}

Row _editNumber(
    {required BuildContext context,
    required String numberType,
    required TextEditingController phoneNumber,
    required DateTime lastupdate,
    required int numberStaet,
    required User user}) {
  return Row(
    children: [
      Expanded(
        child: Opacity(
          opacity: DateTime.now()
                      .difference(DateTime.parse(lastupdate.toString()))
                      .inDays !=
                  7
              ? 0.7
              : 1,
          child: TextFormField(
            style: const TextStyle(color: Colors.white),
            keyboardType: TextInputType.number,
            controller: phoneNumber,
            decoration: InputDecoration(
              hintStyle: const TextStyle(color: Colors.white),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
              ),
              filled: true,
              fillColor: const Color.fromARGB(166, 97, 97, 97),
              hintText: numberType,
            ),
            enabled: false,
          ),
        ),
      ),
      numberStaet == 1
          ? DateTime.now()
                          .difference(DateTime.parse(lastupdate.toString()))
                          .inDays >=
                      7 &&
                  numberStaet != 0
              ? GestureDetector(
                  child: IconButton(
                    icon: const Icon(Icons.edit, color: Colors.white),
                    onPressed: () {
                      context.push(RouteName.addAccountNumber, extra: {
                        "token": user.token,
                        'numberType': numberType
                      });
                    },
                  ),
                )
              : Opacity(
                  opacity: 0.7,
                  child: Container(
                    margin: EdgeInsets.only(left: 10.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: ColorApp.primeryColorDark),
                    padding: const EdgeInsets.all(mainPadding),
                    child: Text(
                      "${(DateTime.now().difference(lastupdate).inDays - 7).abs()} D",
                      style: TextStyles.text_16
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                )
          : phoneNumber.text != '0' &&
                  user.verify != 0 &&
                  phoneNumber.text.isNotEmpty
              ? InkWell(
                  onTap: () {
                    print(numberType);
                    context.push(RouteName.verificationCodeScreen, extra: {
                      "token": user.token,
                      'numberType': numberType,
                      'number': phoneNumber.text
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 10.w),
                    padding:
                        EdgeInsets.symmetric(horizontal: 6.dg, vertical: 10.h),
                    decoration: BoxDecoration(
                        color: ColorApp.primeryColorDark,
                        borderRadius: BorderRadius.circular(12)),
                    child: Text(
                      'Not Verifed',
                      style: TextStyles.text_12,
                    ),
                  ),
                )
              : InkWell(
                  onTap: () {
                    context.push(RouteName.addAccountNumber, extra: {
                      "token": user.token,
                      'numberType': numberType,
                      'number': phoneNumber.text
                    });
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.edit),
                  ))
    ],
  );
}
