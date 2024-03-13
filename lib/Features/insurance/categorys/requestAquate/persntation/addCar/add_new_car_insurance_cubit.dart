import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowaterApp/Features/insurance/categorys/requestAquate/data/repositeory/add_new_car_insurance.dart';
import 'package:mowaterApp/Features/insurance/categorys/requestAquate/model/car_insurance_model.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';
import 'package:mowaterApp/core/style/text_style.dart';
import 'package:mowaterApp/core/widgets/snak_bar.dart';

part 'add_new_car_insurance_state.dart';
part 'add_new_car_insurance_cubit.freezed.dart';

class AddNewCarInsuranceCubit extends Cubit<AddNewCarInsuranceState> {
  final ApiService _apiService;
  AddNewCarInsuranceCubit(this._apiService)
      : super(const AddNewCarInsuranceState.initial());
  addCar(CarInsuranceModel car, context) async {
    emit(const AddNewCarInsuranceState.loading());
    AddCarInsuranceRepository repository =
        AddCarInsuranceRepository(_apiService);

    final response = await repository.addCar(car);
    response.when(
      success: (data) {
        emit(const AddNewCarInsuranceState.success());
        ShowSnakBar(
          context,
          title: 'Success',
          iconData: Icons.info_outline_rounded,
          messageTextStyle:
              TextStyles.text_16.copyWith(fontWeight: FontWeight.bold),
          content: "Car Send Successfuly",
          subtitleTextStyle: TextStyles.text_16,
          backGroundColor: ColorApp.secunderyColorDark,
        );
      },
      failure: (error) {
        emit(const AddNewCarInsuranceState.faliure());
      },
    );
  }
}
