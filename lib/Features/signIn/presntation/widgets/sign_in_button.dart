import 'package:Mowater/Features/signIn/presntation/cubit/sign_in_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/routing/routing_name.dart';
import 'package:Mowater/core/services/user_state.dart';
import 'package:Mowater/core/style/text_style.dart';
import 'package:Mowater/core/widgets/animation_loading_button.dart';
import 'package:Mowater/core/widgets/snak_bar.dart';

Widget SignInButton(
  BuildContext context,
  TextEditingController email,
  TextEditingController password,
) {
  return BlocBuilder<SignInCubit, SignInState>(
    builder: (context, state) {
      return state.when(
          initial: () => LoadingButton(
              buttonText: 'Login'.tr(),
              isLoading: false,
              onPressed: () {
                context.read<SignInCubit>().singIn(
                    contact: email.text,
                    password: password.text,
                    loginType: 'email',
                    userType: '1');
              }),
          loading: () => LoadingButton(
                isLoading: true,
                onPressed: () {}, // Do nothing while loading
                buttonText: '',
              ),
          success: (success) {
            Future(() => context.pushReplacement(RouteName.addAccountNumber,
                    extra: {
                      "token".tr(): success.user!.token,
                      "numberType".tr(): 'phone'.tr()
                    }));
            // UserServices.saveLoginState(success.user);
            return const SizedBox();
          },
          failure: (faliure) {
            Future(() => ShowSnakBar(
                  context,
                  title: 'Failure'.tr(),
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
                context.read<SignInCubit>().singIn(
                    contact: email.text,
                    password: password.text,
                    loginType: 'email',
                    userType: '1');
              },
              buttonText: 'Create Account'.tr(),
            );
          });
    },
  );
}
