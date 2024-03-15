import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:Mowater/Features/signUp/presentation/data/repositeory/google.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/routing/routing_name.dart';
import 'package:Mowater/core/style/text_style.dart';
import 'package:Mowater/core/widgets/snak_bar.dart';
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
        emit(GoogleSignInState.success(user));

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
          backGroundColor: Theme.of(context).colorScheme.secondary,
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
