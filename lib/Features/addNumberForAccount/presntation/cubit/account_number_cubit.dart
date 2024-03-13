import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowaterApp/Features/addNumberForAccount/data/add_number_repo.dart';
import 'package:mowaterApp/Features/addNumberForAccount/models/update_number_response_model.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';

part 'account_number_state.dart';
part 'account_number_cubit.freezed.dart';

class AccountNumberCubit extends Cubit<AccountNumberState> {
  final ApiService _apiService;
  AccountNumberCubit(this._apiService)
      : super(const AccountNumberState.initial());

  updateUserNumber(
      {required String userToken,
      required String number,
      required String? numberType}) async {
    AddAccountNumberUserRepositeory repositeory =
        AddAccountNumberUserRepositeory(_apiService);
    final response = await repositeory.updateNumber(
        userToken: userToken, number: number, numberType: numberType);
    response.when(
      success: (data) {
        emit(AccountNumberState.success(data));
      },
      failure: (error) {
        emit(AccountNumberState.failure(error.toString()));
      },
    );
  }
}
