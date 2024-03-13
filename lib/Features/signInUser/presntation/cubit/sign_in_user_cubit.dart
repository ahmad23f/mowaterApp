import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowaterApp/Features/signInUser/data/signIn_repositeory.dart';
import 'package:mowaterApp/Features/signUp/data/models/user_response.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';
import 'package:mowaterApp/core/services/user_state.dart';

part 'sign_in_user_state.dart';
part 'sign_in_user_cubit.freezed.dart';

class SignInUserCubit extends Cubit<SignInUserState> {
  final ApiService _apiService;
  bool isLoading = false;
  SignInUserCubit(this._apiService) : super(const SignInUserState.initial());
  singIn({required String email, required String password}) async {
    isLoading = true;
    SignInUserRepositeory repository = SignInUserRepositeory(
      _apiService,
    );

    emit(const SignInUserState.loading());
    final response = await repository.signIn(email: email, password: password);
    response.when(
      success: (user) {
        isLoading = false;
        emit(SignInUserState.success(user));
      },
      failure: (error) {
        isLoading = false;

        emit(SignInUserState.failure(error));
      },
    );
  }
}
