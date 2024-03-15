import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:Mowater/Features/carNumbers/data/repositeory/ads.dart';
import 'package:Mowater/core/helper/ads_model.dart';
import 'package:Mowater/core/networking/api/api_service.dart';

part 'plate_ads_state.dart';
part 'plate_ads_cubit.freezed.dart';

class PlateAdsCubit extends Cubit<PlateAdsState> {
  final ApiService _apiService;
  PlateAdsCubit(this._apiService) : super(const PlateAdsState.initial());

  getMainAds() async {
    emit(const PlateAdsState.loading());
    PlateAdsRepositeory repositeory = PlateAdsRepositeory(_apiService);
    final ads = await repositeory.getAllTrending();
    ads.when(
      success: (data) {
        emit(PlateAdsState.success(data));
      },
      failure: (error) {
        emit(const PlateAdsState.faliure());
      },
    );
  }

  getAdsInCategory(int countryId) async {
    emit(const PlateAdsState.loading());
    PlateAdsRepositeory repositeory = PlateAdsRepositeory(_apiService);
    final ads = await repositeory.getInCountry(countryId);
    ads.when(
      success: (data) {
        emit(PlateAdsState.success(data));
      },
      failure: (error) {
        emit(const PlateAdsState.faliure());
      },
    );
  }
}
