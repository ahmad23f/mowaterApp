import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowaterApp/Features/Parking/data/parking_ads_repositeory.dart';
import 'package:mowaterApp/core/helper/ads_model.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';

part 'parking_ads_state.dart';
part 'parking_ads_cubit.freezed.dart';

class ParkingAdsCubit extends Cubit<ParkingAdsState> {
  final ApiService _apiServic;
  ParkingAdsCubit(this._apiServic) : super(const ParkingAdsState.initial());
  getParkingAdsIn(int id) async {
    ParkingAdsRepositeory adsRepositeory = ParkingAdsRepositeory(_apiServic);
    final response = await adsRepositeory.getAdsInEmirateName(id);
    response.when(
      success: (data) {
        emit(ParkingAdsState.success(data));
      },
      failure: (error) {
        emit(ParkingAdsState.faliure(error));
      },
    );
  }
}
