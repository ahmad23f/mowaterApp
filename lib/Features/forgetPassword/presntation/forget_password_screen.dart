import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mowaterApp/Features/forgetPassword/presntation/resetPassword/reset_passwor_cubit.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/constants/size.dart';
import 'package:mowaterApp/core/helper/validator.dart';
import 'package:mowaterApp/core/routing/routing_name.dart';
import 'package:mowaterApp/core/style/text_style.dart';
import 'package:mowaterApp/core/widgets/animation_loading_button.dart';
import 'package:mowaterApp/core/widgets/snak_bar.dart';
import 'package:mowaterApp/core/widgets/text_form_fiedl.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.dg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Forgot password?',
              style:
                  TextStyles.text_30.copyWith(color: ColorApp.primeryColorDark),
            ),
            verticalSpace(13.h),
            Text(
              'Don’t worry! It happens. Please enter the email associated with your account.',
              style: TextStyles.text_16,
            ),
            verticalSpace(38.h),
            Text(
              "Email address",
              style: TextStyles.text_14.copyWith(fontWeight: FontWeight.w500),
            ),
            Form(
              key: formKey,
              child: CustomTextFormField(
                controller: emailController,
                hintText: 'Enter your email address',
                validator: (email) {
                  return emailValidator(email);
                },
              ),
            ),
            verticalSpace(20.h),
            Center(
              child: LoadingButton(
                  isLoading: context.read<ResetPassworCubit>().isLoading,
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      setState(() {});
                      await context
                          .read<ResetPassworCubit>()
                          .sendresetPasswordCode(emailController.text);
                      setState(() {});
                    }
                  },
                  buttonText: 'Send code'),
            ),
            BlocBuilder<ResetPassworCubit, ResetPassworState>(
              builder: (context, state) {
                return state.when(
                  initial: () {
                    return const SizedBox();
                  },
                  success: (message) {
                    Future(() =>
                        context.push(RouteName.verifyResetPasswordCode, extra: {
                          'email': emailController.text,
                        }));
                    return const SizedBox();
                  },
                  failure: (message) {
                    Future(() => ShowSnakBar(
                          context,
                          title: 'Failure',
                          iconData: Icons.info_outline_rounded,
                          messageTextStyle: TextStyles.text_16
                              .copyWith(fontWeight: FontWeight.bold),
                          content: message,
                          subtitleTextStyle: TextStyles.text_16,
                          backGroundColor: ColorApp.secunderyColorDark,
                        ));
                    return const SizedBox();
                  },
                  loading: () => const SizedBox(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
