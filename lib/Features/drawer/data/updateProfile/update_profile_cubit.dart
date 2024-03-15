import 'package:Mowater/Features/drawer/data/repositeory/update_repositeory.dart';
import 'package:Mowater/core/models/authenticationResponse/authentication_response.dart';
import 'package:Mowater/core/models/user_model.dart';
import 'package:Mowater/core/networking/api/api_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_profile_state.dart';
part 'update_profile_cubit.freezed.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final ApiService _apiService;
  bool isLoading = false;
  UpdateProfileCubit(this._apiService)
      : super(const UpdateProfileState.initial());

  updateProfile(UserModel user) async {
    isLoading = true;
    UpdateRepositeory repo = UpdateRepositeory(_apiService);
    final response = await repo.updateInformation(user);
    response.when(
      success: (data) {
        isLoading = false;

        emit(UpdateProfileState.success(data));
      },
      failure: (error) {
        isLoading = false;

        emit(UpdateProfileState.failure(error));
      },
    );
  }
}
