import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mowaterApp/Features/signInUser/presntation/cubit/sign_in_user_cubit.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/routing/routing_name.dart';
import 'package:mowaterApp/core/services/user_state.dart';
import 'package:mowaterApp/core/style/text_style.dart';
import 'package:mowaterApp/core/widgets/animation_loading_button.dart';
import 'package:mowaterApp/core/widgets/snak_bar.dart';

Widget SignInButton(
  BuildContext context,
  TextEditingController email,
  TextEditingController password,
) {
  return BlocBuilder<SignInUserCubit, SignInUserState>(
    builder: (context, state) {
      return state.when(
          initial: () => LoadingButton(
              buttonText: 'Login',
              isLoading: false,
              onPressed: () {
                context
                    .read<SignInUserCubit>()
                    .singIn(email: email.text, password: password.text);
              }),
          loading: () => LoadingButton(
                isLoading: true,
                onPressed: () {}, // Do nothing while loading
                buttonText: '',
              ),
          success: (success) {
            Future(() => context.pushReplacement(RouteName.addAccountNumber,
                    extra: {
                      "token": success.user!.userToken,
                      "numberType": 'phone'
                    }));
            UserServices.saveLoginState(success.user);
            return const SizedBox();
          },
          failure: (faliure) {
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
                context
                    .read<SignInUserCubit>()
                    .singIn(email: email.text, password: password.text);
              },
              buttonText: 'Create Account',
            );
          });
    },
  );
}
