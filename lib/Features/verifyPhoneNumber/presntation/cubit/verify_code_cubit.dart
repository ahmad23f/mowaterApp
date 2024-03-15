import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:Mowater/Features/verifyPhoneNumber/data/resend_code.dart';
import 'package:Mowater/core/networking/api/api_service.dart';

part 'verify_code_state.dart';
part 'verify_code_cubit.freezed.dart';

class ResendOtpCubit extends Cubit<ResendOtpState> {
  final ApiService _apiService;
  ResendOtpCubit(this._apiService) : super(const ResendOtpState.initial());
  resendOtp({
    required String token,
    required String fromTable,
    required String sendTo,
  }) async {
    ResendOTPRepositeory repositeory = ResendOTPRepositeory(_apiService);
    final response = await repositeory.resendOtp(
        fromTable: fromTable, token: token, sendTo: sendTo);
    response.when(
      success: (data) {
        emit(ResendOtpState.success(data));
      },
      failure: (error) {
        emit(ResendOtpState.failure(error));
      },
    );
  }
}
