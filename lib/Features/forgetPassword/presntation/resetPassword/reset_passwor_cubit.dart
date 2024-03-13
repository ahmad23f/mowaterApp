import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowaterApp/Features/forgetPassword/data/reset_code_email_rep.dart';
import 'package:mowaterApp/Features/forgetPassword/models/reset_password_response.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';

part 'reset_passwor_state.dart';
part 'reset_passwor_cubit.freezed.dart';

class ResetPassworCubit extends Cubit<ResetPassworState> {
  final ApiService _apiService;
  bool isLoading = false;
  ResetPassworCubit(this._apiService)
      : super(const ResetPassworState.initial());

  sendresetPasswordCode(String email) async {
    isLoading = true;

    ResetPasswordRepositeory resetPasswordRepositeory =
        ResetPasswordRepositeory(_apiService);
    final response = await resetPasswordRepositeory.resetPassword(email);
    response.when(
      success: (data) {
        isLoading = false;

        emit(ResetPassworState.success(data));
      },
      failure: (error) {
        isLoading = false;

        emit(ResetPassworState.failure(error));
      },
    );
  }

  verifyCode(String email, String code) async {
    ResetPasswordRepositeory resetPasswordRepositeory =
        ResetPasswordRepositeory(_apiService);
    final response =
        await resetPasswordRepositeory.verifyCode(code: code, email: email);
    response.when(
      success: (data) {
        emit(ResetPassworState.success(data));
      },
      failure: (error) {
        emit(ResetPassworState.failure(error));
      },
    );
  }
}
