import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowaterApp/Features/signUp/data/models/user_response.dart';
import 'package:mowaterApp/Features/updateUserInformation/data/update_repo.dart';
import 'package:mowaterApp/Features/updateUserInformation/models/response_update_user.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';

part 'update_user_info_state.dart';
part 'update_user_info_cubit.freezed.dart';

class UpdateUserInfoCubit extends Cubit<UpdateUserInfoState> {
  final ApiService _apiService;
  bool isLoading = false;

  UpdateUserInfoCubit(this._apiService)
      : super(const UpdateUserInfoState.initial());

  update({required UserModel user, File? file}) async {
    isLoading = true;
    UpdateUserInformationRepositeory repositeory =
        UpdateUserInformationRepositeory(_apiService);
    final response = await repositeory.update(user, file);

    response.when(
      success: (data) {
        isLoading = false;

        emit(UpdateUserInfoState.success(data));
      },
      failure: (error) {
        isLoading = false;

        emit(UpdateUserInfoState.faliure(error));
      },
    );
  }
}
