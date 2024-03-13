part of 'my_product_spare_part_cubit.dart';

@freezed
class MyProductSparePartState with _$MyProductSparePartState {
  const factory MyProductSparePartState.initial() = _Initial;
  const factory MyProductSparePartState.success(String message) = _Success;
  const factory MyProductSparePartState.failure(String message) = _Failure;
  const factory MyProductSparePartState.loading() = _Loading;
}
