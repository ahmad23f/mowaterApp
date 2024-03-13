import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:mowaterApp/Features/signUp/data/models/sign_up_request.dart';
import 'package:mowaterApp/Features/signUp/data/models/user_response.dart';
import 'package:mowaterApp/Features/signUp/presentation/cubits/signUp/cubit/sign_up_cubit.dart';
import 'package:mowaterApp/Features/signUp/presentation/data/repositeory/google.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/helper/generate_token.dart';
import 'package:mowaterApp/core/routing/routing_name.dart';
import 'package:mowaterApp/core/services/user_state.dart';
import 'package:mowaterApp/core/style/text_style.dart';
import 'package:mowaterApp/core/widgets/snak_bar.dart';
part 'google_sign_in_cubit.freezed.dart';

part 'google_sign_in_state.dart';

class GoogleSignInCubit extends Cubit<GoogleSignInState> {
  GoogleSignInRepositeory repositeory = GoogleSignInRepositeory();

  GoogleSignInCubit() : super(const GoogleSignInState.initial());
  signIn(BuildContext context) async {
    emit(const GoogleSignInState.loading());

    final response = await repositeory.signIn();
    response.when(
      success: (user) {
        UserServices.saveLoginState(UserModel(
            userType: 'user',
            email: user.email,
            name: user.displayName,
            image: user.photoUrl));
        emit(GoogleSignInState.success(user));
        BlocProvider.of<SignUpCubit>(context).signUp(signUpRequestModel(
            confiermPasswrod: generateToken(),
            password: generateToken(),
            name: user.displayName ?? 'user',
            email: user.email,
            phoneNumber: '0',
            joinedFrom: DateTime.now(),
            image: user.photoUrl!));
        context.push(
          RouteName.home,
        );
      },
      failure: (error) {
        emit(GoogleSignInState.faliure(error));
        ShowSnakBar(
          context,
          title: 'Failure',
          iconData: Icons.info_outline_rounded,
          messageTextStyle:
              TextStyles.text_16.copyWith(fontWeight: FontWeight.bold),
          content: error,
          subtitleTextStyle: TextStyles.text_16,
          backGroundColor: ColorApp.secunderyColorDark,
        );
      },
    );
  }

  signOut() async {
    emit(const GoogleSignInState.loading());
    final response = await repositeory.signOut();
    response.when(
      success: (data) {
        emit(GoogleSignInState.success(data));
      },
      failure: (error) {
        emit(GoogleSignInState.faliure(error));
      },
    );
  }
}
