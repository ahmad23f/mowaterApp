import 'package:Mowater/core/models/user_model.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:Mowater/Features/verifyPhoneNumber/data/verify.dart';
import 'package:Mowater/core/networking/api/api_service.dart';

part 'otp_verify_cubit.freezed.dart';
part 'otp_verify_state.dart';

class OtpVerifyCubit extends Cubit<OtpVerifyState> {
  final ApiService _apiService;
  OtpVerifyCubit(this._apiService) : super(const OtpVerifyState.initial());

  Future<void> verifyCode(
    String phoneNumber,
    String code,
    String sendTo,
  ) async {
    VerifyCodeRepositeory repositeory = VerifyCodeRepositeory(_apiService);
    emit(const OtpVerifyState.loading());
    final response = await repositeory.verify(
        phoneNumber: phoneNumber, code: code, sendTo: sendTo);
    response.when(
      success: (user) {
        emit(OtpVerifyState.success(user));
      },
      failure: (error) {
        emit(OtpVerifyState.faliure(error));
      },
    );
  }
}
