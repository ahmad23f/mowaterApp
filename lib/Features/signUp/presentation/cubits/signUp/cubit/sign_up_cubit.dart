import 'dart:io';

import 'package:Mowater/Features/signUp/data/repositeory/sign_up.dart';
import 'package:Mowater/core/models/authenticationResponse/authentication_response.dart';
import 'package:Mowater/core/models/user_model.dart';
import 'package:Mowater/core/networking/api/api_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_cubit.freezed.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final ApiService _apiService;
  SignUpCubit(this._apiService) : super(const SignUpState.initial());
  bool isLoading = false;
  signUp({
    required UserModel user,
    File? image,
    File? attachment,
  }) async {
    isLoading = true;
    emit(const SignUpState.loading());
    SignUpRepositeory repositeory = SignUpRepositeory(_apiService);
    final response = await repositeory.signUp(
      user: user,
      attachment: attachment, 
      image: image,
    );
    response.when(
      success: (data) {
        isLoading = false;

        emit(SignUpState.success(data));
      },
      failure: (error) {
        isLoading = false;
        emit(SignUpState.faliure(error));
      },
    );
  }
}
