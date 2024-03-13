import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowaterApp/Features/home/data/repository/trend_repsitory.dart';
import 'package:mowaterApp/Features/home/models/trendingModel/trend_model.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';

part 'trend_state.dart';
part 'trend_cubit.freezed.dart';

class TrendCubit extends Cubit<TrendState> {
  final ApiService _apiService;
  TrendCubit(this._apiService) : super(const TrendState.initial());
  getAllTrending() async {
    emit(const TrendState.loading());
    final TrendRepsiteory trendRepsiteory = TrendRepsiteory(_apiService);

    final respons = await trendRepsiteory.getAllTrending();
    respons.when(
      success: (data) {
        emit(TrendState.success(data));
      },
      failure: (error) {
        emit(TrendState.failure(error));
      },
    );
  }
}
