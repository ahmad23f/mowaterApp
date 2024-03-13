import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowaterApp/Features/CareForSaleBrand/data/repositeory/ads_repositeory.dart';
import 'package:mowaterApp/core/helper/ads_model.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';

part 'brand_ads_cubit_state.dart';
part 'brand_ads_cubit_cubit.freezed.dart';

class BrandAdsCubitCubit extends Cubit<BrandAdsCubitState> {
  final ApiService _apiService;
  BrandAdsCubitCubit(this._apiService)
      : super(const BrandAdsCubitState.initial());
  getAds() async {
    BrandsAdsRepositeory adsRepositeory = BrandsAdsRepositeory(_apiService);
    final response = await adsRepositeory.getAdsInBrands();
    response.when(
      success: (data) {
        emit(BrandAdsCubitState.success(data));
      },
      failure: (error) {
        emit(BrandAdsCubitState.faliure(error));
      },
    );
  }
}
