import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mowaterApp/Features/signUp/data/models/sign_up_request.dart';
import 'package:mowaterApp/Features/signUp/presentation/cubits/signUp/cubit/sign_up_cubit.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/routing/routing_name.dart';
import 'package:mowaterApp/core/services/user_state.dart';
import 'package:mowaterApp/core/style/text_style.dart';
import 'package:mowaterApp/core/widgets/animation_loading_button.dart';
import 'package:mowaterApp/core/widgets/snak_bar.dart';

Widget signUpUserButton(
  BuildContext context,
  GlobalKey<FormState> formKey,
  TextEditingController email,
  String image,
  TextEditingController password,
  TextEditingController confirmPassword,
  TextEditingController name,
) {
  return BlocBuilder<SignUpCubit, SignUpState>(
    builder: (context, state) {
      return state.when(
          initial: () => LoadingButton(
                isLoading: false,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context.read<SignUpCubit>().signUp(signUpRequestModel(
                        confiermPasswrod: confirmPassword.text,
                        password: password.text,
                        name: name.text,
                        email: email.text,
                        phoneNumber: '0',
                        joinedFrom: DateTime.now(),
                        image: image));
                  }
                },
                buttonText: 'Create Account',
              ),
          loading: () => LoadingButton(
                isLoading: true,
                onPressed: () {},
                buttonText: '',
              ),
          success: (success) {
            UserServices.saveLoginState(success.user);
            Future(
                () => context.push(RouteName.verificationEmailScreen, extra: {
                      'email': success.user!.email,
                    }));
            return LoadingButton(
              isLoading: false,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  context.read<SignUpCubit>().signUp(signUpRequestModel(
                      confiermPasswrod: confirmPassword.text,
                      password: password.text,
                      name: name.text,
                      email: email.text,
                      phoneNumber: '0',
                      joinedFrom: DateTime.now(),
                      image: image));
                }
              },
              buttonText: 'Create Account',
            );
          },
          faliure: (faliure) {
            Future(() => ShowSnakBar(
                  context,
                  title: 'Failure',
                  iconData: Icons.info_outline_rounded,
                  messageTextStyle:
                      TextStyles.text_16.copyWith(fontWeight: FontWeight.bold),
                  content: faliure,
                  subtitleTextStyle: TextStyles.text_16,
                  backGroundColor: ColorApp.secunderyColorDark,
                ));
            return LoadingButton(
              isLoading: false,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  context.read<SignUpCubit>().signUp(signUpRequestModel(
                      confiermPasswrod: confirmPassword.text,
                      password: password.text,
                      name: name.text,
                      email: email.text,
                      phoneNumber: '0',
                      joinedFrom: DateTime.now(),
                      image: image));
                }
              },
              buttonText: 'Create Account',
            );
          });
    },
  );
}
