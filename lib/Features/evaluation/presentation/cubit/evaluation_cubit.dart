import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'evaluation_state.dart';
part 'evaluation_cubit.freezed.dart';

class EvaluationCubit extends Cubit<EvaluationState> {
  EvaluationCubit() : super(const EvaluationState.initial());
}
