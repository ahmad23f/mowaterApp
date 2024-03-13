part of 'evaluation_cubit.dart';

@freezed
class EvaluationState with _$EvaluationState {
  const factory EvaluationState.initial() = _Initial;
  const factory EvaluationState.succss() = _Success;
  const factory EvaluationState.faliure() = _Falire;
  const factory EvaluationState.loading() = _Loading;
}
