import 'dart:io';

import 'package:Mowater/Features/drawer/data/updateProfile/update_profile_cubit.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/models/user_model.dart';
import 'package:Mowater/core/routing/routing_name.dart';
import 'package:Mowater/core/services/user_hive_model.dart';
import 'package:Mowater/core/services/user_state.dart';
import 'package:Mowater/core/style/text_style.dart';
import 'package:Mowater/core/widgets/animation_loading_button.dart';
import 'package:Mowater/core/widgets/text_form_fiedl.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class EditProfileForm extends StatefulWidget {
  File? image;
  EditProfileForm({super.key, required this.image});

  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  late UserHiveModel user;
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
    userName = TextEditingController(text: user.name);
    email = TextEditingController(text: user.email);
    phoneNumber = TextEditingController(text: user.phoneNumber);
    password = TextEditingController(text: user.password);
    whatsAppNumber = TextEditingController(text: user.whatsAppNumber);
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
                      'Nick Name'.tr(),
                      style: TextStyles.text_12,
                    ),
                  ),
                  CustomTextFormField(
                    hintText: 'Nick Name'.tr(),
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
                      'Full Name'.tr(),
                      style: TextStyles.text_12,
                    ),
                  ),
                  CustomTextFormField(
                    hintText: 'Full Name'.tr(),
                    controller: userName,
                    label: 'name'.tr(),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 8.0.w),
          child: Text(
            'Phone Number'.tr(),
            style: TextStyles.text_12,
          ),
        ),
        _editNumber(
            context: context,
            numberType: 'Phone Number'.tr(),
            phoneNumber: phoneNumber,
            lastupdate: user.lastUpdatePhone ?? DateTime(2020),
            user: user),
        verticalSpace(15.h),
        Padding(
          padding: EdgeInsets.only(left: 8.0.w),
          child: Text(
            'WhatsApp Number'.tr(),
            style: TextStyles.text_12,
          ),
        ),
        _editNumber(
            context: context,
            numberType: 'WhatsApp Number'.tr(),
            phoneNumber: whatsAppNumber,
            lastupdate: user.lastUpdateWhatsAppNumber ?? DateTime(2020),
            user: user),
        verticalSpace(15.h),
        Center(
          child: LoadingButton(
            buttonText: 'Save'.tr(),
            isLoading: context.read<UpdateProfileCubit>().isLoading,
            onPressed: () async {
              setState(() {});
              UserServices.updateUserInfo(
                  UserHiveModel(nickName: nickName.text, name: userName.text));
              await context.read<UpdateProfileCubit>().updateProfile(
                    UserModel(
                        type: UserServices.getUserInformation().type,
                        nickName: nickName.text,
                        name: userName.text,
                        image: widget.image?.path,
                        id: user.id),
                  );

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
    required UserHiveModel user}) {
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
      user.lastUpdatePhone == 1
          ? DateTime.now()
                      .difference(DateTime.parse(lastupdate.toString()))
                      .inDays >=
                  7
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
          : phoneNumber.text != '0' && phoneNumber.text.isNotEmpty
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
                      'Not Verifed'.tr(),
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
