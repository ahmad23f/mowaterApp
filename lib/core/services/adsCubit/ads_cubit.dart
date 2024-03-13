import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowaterApp/core/helper/ads_model.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';
import 'package:mowaterApp/core/services/ads_repo.dart';

part 'ads_state.dart';
part 'ads_cubit.freezed.dart';

class AdsCubit extends Cubit<AdsState> {
  final ApiService _apiService;
  AdsCubit(this._apiService) : super(const AdsState.initial());

  getAds(String tableName) async {
    emit(const AdsState.loading());
    AdsRepositeory repositeory = AdsRepositeory(_apiService);
    final respone = await repositeory.getAdS(tableName);
    respone.when(
      success: (data) {
        emit(AdsState.success(data));
      },
      failure: (error) {
        emit(const AdsState.faliure());
      },
    );
  }
}
