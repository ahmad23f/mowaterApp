import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowaterApp/Features/sparePartCompany/data/my_product_repo.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';

part 'my_product_spare_part_state.dart';
part 'my_product_spare_part_cubit.freezed.dart';

class MyProductSparePartCubit extends Cubit<MyProductSparePartState> {
  final ApiService _apiService;
  MyProductSparePartCubit(this._apiService)
      : super(const MyProductSparePartState.initial());

  getMyProductSparePart(int id) async {
    GetMaySparePartProductRepo getMaySparePartProductRepo =
        GetMaySparePartProductRepo(_apiService);

    final response = await getMaySparePartProductRepo.getMyProdcut(id);
    response.when(
      success: (data) {
        emit(MyProductSparePartState.success(data));
      },
      failure: (error) {
        emit(MyProductSparePartState.failure(error));
      },
    );
  }
}
