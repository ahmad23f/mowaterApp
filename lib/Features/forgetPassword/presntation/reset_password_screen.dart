import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mowaterApp/Features/signUp/data/models/user_response.dart';
import 'package:mowaterApp/Features/updateUserInformation/presntation/cubit/update_user_info_cubit.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/constants/size.dart';
import 'package:mowaterApp/core/helper/validator.dart';
import 'package:mowaterApp/core/routing/routing_name.dart';
import 'package:mowaterApp/core/services/user_type.dart';
import 'package:mowaterApp/core/style/text_style.dart';
import 'package:mowaterApp/core/widgets/animation_loading_button.dart';
import 'package:mowaterApp/core/widgets/snak_bar.dart';
import 'package:mowaterApp/core/widgets/text_form_fiedl.dart';

class ResetPasswordScreen extends StatefulWidget {
  int id;
  ResetPasswordScreen({super.key, required this.id});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController password = TextEditingController();
    TextEditingController confirmPassowr = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(mainPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Reset Passowrd",
                style: TextStyles.text_30
                    .copyWith(color: ColorApp.primeryColorDark),
              ),
              verticalSpace(13.h),
              Text(
                'Please type something you’ll remember',
                style: TextStyles.text_16,
              ),
              verticalSpace(38.h),
              Text(
                "New password",
                style: TextStyles.text_14.copyWith(fontWeight: FontWeight.w500),
              ),
              CustomTextFormField(
                controller: password,
                hintText: 'new passowrd',
                validator: (p0) {
                  return passwordValidator(p0!);
                },
              ),
              verticalSpace(22.h),
              Text(
                "Confirm password",
                style: TextStyles.text_14.copyWith(fontWeight: FontWeight.w500),
              ),
              CustomTextFormField(
                controller: confirmPassowr,
                hintText: 'confirm passowrd',
                validator: (confirmPassword) {
                  if (confirmPassword != password.text) {
                    return 'Password not match';
                  }
                  return null;
                },
              ),
              verticalSpace(38),
              Center(
                child: LoadingButton(
                    isLoading: context.read<UpdateUserInfoCubit>().isLoading,
                    onPressed: () async {
                      setState(() {});
                      if (formKey.currentState!.validate()) {
                        setState(() {});
                      }
                    },
                    buttonText: 'Reset password'),
              ),
              BlocBuilder<UpdateUserInfoCubit, UpdateUserInfoState>(
                builder: (context, state) {
                  return state.when(
                      initial: () => const SizedBox(),
                      success: (status) {
                        Future.delayed(
                          Duration.zero,
                          () => context.go(RouteName.passwordChangedSuccess),
                        );
                        return const SizedBox();
                      },
                      faliure: (error) {
                        Future.delayed(
                          Duration.zero,
                          () => ShowSnakBar(context,
                              title: 'Failure', backGroundColor: Colors.red),
                        );
                        return const SizedBox();
                      },
                      loading: () => const SizedBox());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
