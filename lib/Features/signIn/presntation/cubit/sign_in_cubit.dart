import 'package:Mowater/Features/signIn/data/signIn_repositeory.dart';
import 'package:Mowater/core/models/authenticationResponse/authentication_response.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:Mowater/core/networking/api/api_service.dart';

part 'sign_in_state.dart';
part 'sign_in_cubit.freezed.dart';

class SignInCubit extends Cubit<SignInState> {
  final ApiService _apiService;
  bool isLoading = false;
  SignInCubit(this._apiService) : super(const SignInState.initial());
  singIn(
      {required String contact,
      required String password,
      required String loginType,
      required String userType}) async {
    isLoading = true;
    SignInRepositeory repository = SignInRepositeory(
      _apiService,
    );

    emit(const SignInState.loading());
    print(userType);
    print(loginType);
    print(contact);
    final response = await repository.signIn(
        contact: contact,
        password: password,
        loginType: loginType,
        userType: userType);
    response.when(
      success: (user) {
        isLoading = false;
        emit(SignInState.success(user));
      },
      failure: (error) {
        print(error);
        isLoading = false;

        emit(SignInState.failure(error));
      },
    );
  }
}
