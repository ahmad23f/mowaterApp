import 'dart:io';

import 'package:Mowater/Features/drawer/data/updateProfile/update_profile_cubit.dart';
import 'package:Mowater/core/models/user_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/routing/routing_name.dart';
import 'package:Mowater/core/services/user_state.dart';
import 'package:Mowater/core/services/user_type.dart';
import 'package:Mowater/core/style/text_style.dart';
import 'package:Mowater/core/widgets/animation_loading_button.dart';
import 'package:Mowater/core/widgets/text_form_fiedl.dart';

class AddBasicInfoFormUser extends StatelessWidget {
  TextEditingController nickNamecontroller;
  TextEditingController fullNameController;
  File? image;

  AddBasicInfoFormUser({
    super.key,
    required this.nickNamecontroller,
    required this.fullNameController,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
              controller: nickNamecontroller,
              label: '',
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0.w),
              child: Text(
                'Full Name'.tr(),
                style: TextStyles.text_12,
              ),
            ),
            CustomTextFormField(
              hintText: 'Full Name'.tr(),
              controller: fullNameController,
              label: '',
            ),
          ],
        ),
        verticalSpace(15.h),
        AddBasicInfoButton(
            nickNamecontroller: nickNamecontroller,
            fullNameController: fullNameController,
            image: image),
      ],
    );
  }
}

class AddBasicInfoButton extends StatefulWidget {
  const AddBasicInfoButton({
    super.key,
    required this.nickNamecontroller,
    required this.fullNameController,
    required this.image,
  });

  final TextEditingController nickNamecontroller;
  final TextEditingController fullNameController;
  final File? image;

  @override
  State<AddBasicInfoButton> createState() => _AddBasicInfoButtonState();
}

class _AddBasicInfoButtonState extends State<AddBasicInfoButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingButton(
        isLoading: context.read<UpdateProfileCubit>().isLoading,
        buttonText: 'Save'.tr(),
        onPressed: () async {
          setState(() {});
          await context.read<UpdateProfileCubit>().updateProfile(
                UserModel(
                    type: '0',
                    nickName: widget.nickNamecontroller.text,
                    name: widget.fullNameController.text,
                    image: widget.image?.path,
                    id: UserServices.getUserInformation().id),
              );
          context.push(RouteName.home);
        },
      ),
    );
  }
}
