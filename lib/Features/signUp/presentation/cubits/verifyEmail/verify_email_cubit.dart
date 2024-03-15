import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:Mowater/Features/signUp/presentation/data/repositeory/email_verify.dart';
import 'package:Mowater/core/networking/api/api_service.dart';
import 'package:Mowater/core/routing/routing_name.dart';
import 'package:Mowater/core/services/user_state.dart';

part 'verify_email_state.dart';
part 'verify_email_cubit.freezed.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  final ApiService _apiService;
  VerifyEmailCubit(this._apiService) : super(const VerifyEmailState.initial());
  verify(
      {required String email,
      required String code,
      required BuildContext context}) async {
    VerifyEmailRepositeory repositeory = VerifyEmailRepositeory(_apiService);
    final response =
        await repositeory.verifyEmail(email: email, verifyCode: code);
    response.when(
      success: (data) {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          if (UserServices.getUserInformation().id != -1 &&
              UserServices.getUserInformation().nickName != 'Ghost' &&
              UserServices.getUserInformation().name != '') {
            context.go(RouteName.home);
          } else {
            GoRouter.of(context)
                .go(RouteName.userInformationScreen, extra: false);
          }
        });
        emit(VerifyEmailState.success(data));
      },
      failure: (error) {
        emit(VerifyEmailState.failure(error));
      },
    );
  }

  resendCode({
    required String email,
  }) async {
    VerifyEmailRepositeory repositeory = VerifyEmailRepositeory(_apiService);
    final response = await repositeory.resednCode(email);
    response.when(
      success: (data) {
        emit(VerifyEmailState.success(data));
      },
      failure: (error) {
        emit(VerifyEmailState.failure(error));
      },
    );
  }
}
