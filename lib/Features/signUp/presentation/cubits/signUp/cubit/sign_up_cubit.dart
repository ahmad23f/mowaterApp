import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowaterApp/Features/signUp/data/models/sign_up_request.dart';
import 'package:mowaterApp/Features/signUp/data/models/user_response.dart';
import 'package:mowaterApp/Features/signUp/data/repositeory/sign_up.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';

part 'sign_up_cubit.freezed.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final ApiService _apiService;
  SignUpCubit(this._apiService) : super(const SignUpState.initial());
  bool isLoading = false;
  signUp(signUpRequestModel user) async {
    isLoading = true;
    emit(const SignUpState.loading());
    SignUpRepositeory repositeory = SignUpRepositeory(_apiService);
    final response = await repositeory.signUp(user);
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
