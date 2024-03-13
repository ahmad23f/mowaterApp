import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mowaterApp/Features/signUp/data/models/user_response.dart';
import 'package:mowaterApp/Features/updateUserInformation/presntation/cubit/update_user_info_cubit.dart';
import 'package:mowaterApp/core/constants/size.dart';
import 'package:mowaterApp/core/routing/routing_name.dart';
import 'package:mowaterApp/core/services/user_state.dart';
import 'package:mowaterApp/core/services/user_type.dart';
import 'package:mowaterApp/core/style/text_style.dart';
import 'package:mowaterApp/core/widgets/animation_loading_button.dart';
import 'package:mowaterApp/core/widgets/text_form_fiedl.dart';

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
                'Nick Name',
                style: TextStyles.text_12,
              ),
            ),
            CustomTextFormField(
              hintText: 'Nick Name',
              controller: nickNamecontroller,
              label: '',
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0.w),
              child: Text(
                'Full Name',
                style: TextStyles.text_12,
              ),
            ),
            CustomTextFormField(
              hintText: 'Full Name',
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
        isLoading: context.read<UpdateUserInfoCubit>().isLoading,
        buttonText: 'Save',
        onPressed: () async {
          setState(() {});
          await context.read<UpdateUserInfoCubit>().update(
              user: UserModel(
                  userType: 'ghost',
                  nickname: widget.nickNamecontroller.text,
                  name: widget.fullNameController.text,
                  image: widget.image?.path,
                  id: UserServices.getUserInformation().id),
              file: widget.image);
          context.push(RouteName.home);
        },
      ),
    );
  }
}
