import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:Mowater/Features/Service24/data/repositeory/near_recovery_repo.dart';
import 'package:Mowater/Features/Service24/models/recovery_model.dart';
import 'package:Mowater/core/networking/api/api_service.dart';

part 'recovery_state.dart';
part 'recovery_cubit.freezed.dart';

class Service24Cubit extends Cubit<RecoveryState> {
  final ApiService _apiService;
  Service24Cubit(this._apiService) : super(const RecoveryState.initial());
  getNearestRecovery(double? lat, double? long, String category) async {
    emit(const RecoveryState.loading());
    NearRecoveryRepositeory nearRecoveryRepositeory =
        NearRecoveryRepositeory(_apiService);
    final response = await nearRecoveryRepositeory.getNear(lat, long, category);
    response.when(
      success: (data) {
        emit(RecoveryState.success(data));
      },
      failure: (error) {
        emit(const RecoveryState.faliure());
      },
    );
  }
}
