import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowaterApp/Features/home/data/repository/main_category_repsiteory.dart';
import 'package:mowaterApp/Features/home/models/mainCategorys/main_categorys_model.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';

part 'main_categorys_cubit.freezed.dart';
part 'main_categorys_state.dart';

class MainCategorysCubit extends Cubit<MainCategorysState> {
  final ApiService _apiService;
  MainCategorysCubit(this._apiService)
      : super(const MainCategorysState.initial());

  getAllCategories() async {
    emit(const MainCategorysState.loading());
    try {
      final mainCategorysRepository =
          await MainCategorysRepository(_apiService).getAllCategories();

      mainCategorysRepository.when(
        success: (data) {
          emit(MainCategorysState.success(data));
        },
        failure: (error) {
          emit(MainCategorysState.failure(error));
        },
      );
    } catch (e) {
      print('Error in MainCategorysCubit: $e');
      emit(MainCategorysState.failure('An error occurred: $e'));
    }
  }
}
