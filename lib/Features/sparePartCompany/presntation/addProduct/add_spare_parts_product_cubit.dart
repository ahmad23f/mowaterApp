import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowaterApp/Features/mowaterMart/data/model/mowater_mart_product_model.dart';
import 'package:mowaterApp/Features/sparePartCompany/data/add_product_repo.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';

part 'add_spare_parts_product_state.dart';
part 'add_spare_parts_product_cubit.freezed.dart';

class AddSparePartsProductCubit extends Cubit<AddSparePartsProductState> {
  final ApiService _apiService;
  AddSparePartsProductCubit(this._apiService)
      : super(const AddSparePartsProductState.initial());
  addProduct(MowaterMartProductModel martProductModel) async {
    AddNewProductSparePartsRepo addNewProductSparePartsRepo =
        AddNewProductSparePartsRepo(_apiService);
    final response =
        await addNewProductSparePartsRepo.addProduct(martProductModel);
    response.when(
      success: (data) {
        emit(AddSparePartsProductState.sucess(data));
      },
      failure: (error) {
        emit(AddSparePartsProductState.failure(error));
      },
    );
  }
}
