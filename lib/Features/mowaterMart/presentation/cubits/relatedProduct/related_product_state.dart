part of 'related_product_cubit.dart';

@freezed
class RelatedProductState with _$RelatedProductState {
  const factory RelatedProductState.initial() = _Initial;
  const factory RelatedProductState.loading() = _Loading;
  const factory RelatedProductState.failure() = _Failure;
  const factory RelatedProductState.success(
      List<MowaterMartProductModel> data) = _Success;
}
