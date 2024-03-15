import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:Mowater/Features/carNumbers/data/repositeory/plates_category.dart';
import 'package:Mowater/Features/carNumbers/models/plate_model.dart';
import 'package:Mowater/core/networking/api/api_service.dart';

part 'plate_category_state.dart';
part 'plate_category_cubit.freezed.dart';

class PlateCategoryCubit extends Cubit<PlateCategoryState> {
  final ApiService _apiService;
  PlateCategoryCubit(this._apiService)
      : super(const PlateCategoryState.initial());
  getCategory({
    required String source,
    String? plateNumber,
    String? maxPrice,
    String? minPrice,
    int? plateLength,
  }) async {
    emit(const PlateCategoryState.loading());
    PlateCategoryRepositeory repositeory =
        PlateCategoryRepositeory(_apiService);
    final resposne = await repositeory.getPlates(
      source: source,
      plateNumber: plateNumber,
      maxPrice: maxPrice,
      minPrice: minPrice,
      plateLength: plateLength,
    );
    resposne.when(
      success: (data) {
        emit(PlateCategoryState.success(data));
      },
      failure: (error) {
        print(error);
        print('=====');
        emit(const PlateCategoryState.faliure());
      },
    );
  }
}
