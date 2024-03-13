import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowaterApp/Features/Parking/data/parking_ads_repositeory.dart';
import 'package:mowaterApp/core/helper/ads_model.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';

part 'main_parking_ads_state.dart';
part 'main_parking_ads_cubit.freezed.dart';

class MainParkingAdsCubit extends Cubit<MainParkingAdsState> {
  final ApiService _apiService;
  MainParkingAdsCubit(this._apiService)
      : super(const MainParkingAdsState.initial());

  mainParkingAds() async {
    ParkingAdsRepositeory adsRepositeory = ParkingAdsRepositeory(_apiService);
    final response = await adsRepositeory.getMainParkingAds();
    response.when(
      success: (data) {
        emit(MainParkingAdsState.success(data));
      },
      failure: (error) {
        emit(const MainParkingAdsState.faliure());
      },
    );
  }
}
