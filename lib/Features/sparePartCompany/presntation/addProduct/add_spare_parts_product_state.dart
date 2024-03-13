part of 'add_spare_parts_product_cubit.dart';

@freezed
class AddSparePartsProductState with _$AddSparePartsProductState {
  const factory AddSparePartsProductState.initial() = _Initial;
  const factory AddSparePartsProductState.sucess(String message) = _Success;
  const factory AddSparePartsProductState.failure(String message) = _Failure;
  const factory AddSparePartsProductState.loading() = _Loading;
}
