part of 'related_car_cubit.dart';

@freezed
class RelatedCarState with _$RelatedCarState {
  const factory RelatedCarState.initial() = _Initial;
  const factory RelatedCarState.succss(List<CarProduct> cars) = _Success;
  const factory RelatedCarState.loading() = _Loading;
  const factory RelatedCarState.faliure() = _Faliure;
}
