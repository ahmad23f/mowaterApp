part of 'plate_category_cubit.dart';

@freezed
class PlateCategoryState with _$PlateCategoryState {
  const factory PlateCategoryState.initial() = _Initial;
  const factory PlateCategoryState.success(List<PlateModelForSale> ads) =
      _Success;
  const factory PlateCategoryState.faliure() = _Faliure;
  const factory PlateCategoryState.loading() = _Loading;
}
