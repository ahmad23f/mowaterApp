import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowaterApp/Features/showRooms/data/repositeory/ads_repo.dart';
import 'package:mowaterApp/core/helper/ads_model.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';

part 'show_rooms_ads_state.dart';
part 'show_rooms_ads_cubit.freezed.dart';

class ShowRoomsAdsCubit extends Cubit<ShowRoomsAdsState> {
  final ApiService _apiService;
  ShowRoomsAdsCubit(this._apiService)
      : super(const ShowRoomsAdsState.initial());
  getAds() async {
    AdsShowRoomsRepositeory showRoomsRepositeory =
        AdsShowRoomsRepositeory(_apiService);

    final response = await showRoomsRepositeory.getAds();
    response.when(
      success: (data) {
        emit(ShowRoomsAdsState.success(data));
      },
      failure: (error) {
        emit(const ShowRoomsAdsState.faliure());
      },
    );
  }
}
