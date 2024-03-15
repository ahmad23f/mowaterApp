import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:Mowater/Features/inspection/data/repositeory/ads.dart';
import 'package:Mowater/core/helper/ads_model.dart';
import 'package:Mowater/core/networking/api/api_service.dart';

part 'inspection_ads_state.dart';
part 'inspection_ads_cubit.freezed.dart';

class InspectionAdsCubit extends Cubit<InspectionAdsState> {
  final ApiService _apiService;
  InspectionAdsCubit(this._apiService)
      : super(const InspectionAdsState.initial());
  getAds() async {
    InspectionAdsRepositeory repositeory =
        InspectionAdsRepositeory(_apiService);
    final response = await repositeory.getAds();
    response.when(
      success: (data) {
        emit(InspectionAdsState.success(data));
      },
      failure: (error) {
        print(error);
        emit(const InspectionAdsState.faliure());
      },
    );
  }
}
