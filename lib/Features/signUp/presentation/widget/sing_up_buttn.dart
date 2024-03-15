import 'dart:io';

import 'package:Mowater/core/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:Mowater/Features/signUp/data/models/sign_up_request.dart';
import 'package:Mowater/Features/signUp/presentation/cubits/signUp/cubit/sign_up_cubit.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/routing/routing_name.dart';
import 'package:Mowater/core/services/user_state.dart';
import 'package:Mowater/core/style/text_style.dart';
import 'package:Mowater/core/widgets/animation_loading_button.dart';
import 'package:Mowater/core/widgets/snak_bar.dart';

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
                    context.read<SignUpCubit>().signUp(
                        user: UserModel(
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
            // UserServices.saveLoginState(success.user);
            Future(
                () => context.push(RouteName.verificationEmailScreen, extra: {
                      'email': success.user!.email,
                    }));
            return LoadingButton(
              isLoading: false,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  context.read<SignUpCubit>().signUp(
                      user: UserModel(
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
                  backGroundColor: Theme.of(context).colorScheme.secondary,
                ));
            return LoadingButton(
              isLoading: false,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  context.read<SignUpCubit>().signUp(
                      user: UserModel(
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
