import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:Mowater/Features/UsedSpareParts/data/repositeory/ads_repositeory.dart';
import 'package:Mowater/core/helper/ads_model.dart';
import 'package:Mowater/core/networking/api/api_service.dart';

part 'used_spare_parts_ads_state.dart';
part 'used_spare_parts_ads_cubit.freezed.dart';

class UsedSparePartsAdsCubit extends Cubit<UsedSparePartsAdsState> {
  final ApiService _apiService;
  UsedSparePartsAdsCubit(this._apiService)
      : super(const UsedSparePartsAdsState.initial());

  getMainAds() async {
    UsedSparePartsRepositeory repositeory =
        UsedSparePartsRepositeory(_apiService);
    emit(const UsedSparePartsAdsState.loading());

    final response = await repositeory.getMainAds();
    response.when(
      success: (ads) {
        emit(UsedSparePartsAdsState.success(ads));
      },
      failure: (error) {
        emit(const UsedSparePartsAdsState.faliure());
      },
    );
  }

  getcategoryAds(int id) async {
    emit(const UsedSparePartsAdsState.loading());

    UsedSparePartsRepositeory repositeory =
        UsedSparePartsRepositeory(_apiService);

    final response = await repositeory.getCategoryAds(id + 1);
    print(response);
    response.when(
      success: (ads) {
        emit(UsedSparePartsAdsState.success(ads));
      },
      failure: (error) {
        emit(const UsedSparePartsAdsState.faliure());
      },
    );
  }
}
