part of 'spare_parts_category_cubit.dart';

@freezed
class SparePartsCategoryState with _$SparePartsCategoryState {
  const factory SparePartsCategoryState.initial() = _Initial;
  const factory SparePartsCategoryState.succss(
      List<SpatepartsCompanyModel> copmanyes) = _Success;
  const factory SparePartsCategoryState.faliure() = _Faliure;
  const factory SparePartsCategoryState.loading() = _Loading;
}
