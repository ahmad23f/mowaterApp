import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowaterApp/Features/mowaterMart/data/repositeory/mowater_mart_ads_repositeory.dart';
import 'package:mowaterApp/core/helper/ads_model.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';

part 'mowater_mart_ads_state.dart';
part 'mowater_mart_ads_cubit.freezed.dart';

class MowaterMartAdsCubit extends Cubit<MowaterMartAdsState> {
  final ApiService _apiService;
  MowaterMartAdsCubit(this._apiService)
      : super(const MowaterMartAdsState.initial());
  getAds() async {
    emit(const MowaterMartAdsState.loading());
    MowaterMartAdsReposite adsReposite = MowaterMartAdsReposite(_apiService);

    final response = await adsReposite.getAds();
    response.when(
      success: (data) {
        emit(MowaterMartAdsState.success(data));
      },
      failure: (error) {
        print(error);
        emit(const MowaterMartAdsState.faliure());
      },
    );
  }
}
