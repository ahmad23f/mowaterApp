import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowaterApp/Features/carNumbers/data/repositeory/sell_your_plate.dart';
import 'package:mowaterApp/Features/carNumbers/models/plate_model.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';
import 'package:mowaterApp/core/style/text_style.dart';
import 'package:mowaterApp/core/widgets/snak_bar.dart';

part 'sell_you_plate_state.dart';
part 'sell_you_plate_cubit.freezed.dart';

class SellYouPlateCubit extends Cubit<SellYouPlateState> {
  final ApiService _apiService;
  SellYouPlateCubit(this._apiService)
      : super(
          const SellYouPlateState.initial(),
        );
  sellYourPlate(PlateModelForSale plate, BuildContext context) async {
    emit(const SellYouPlateState.loading());
    SellYourPlateRepositeory plateRepositeory =
        SellYourPlateRepositeory(_apiService);
    final response = await plateRepositeory.addPlate(plate: plate);
    response.when(
      success: (data) {
        final dataDeoded = jsonDecode(data);
        print(dataDeoded);

        if (dataDeoded['success'] == true) {
          emit(SellYouPlateState.success(dataDeoded['message']));
          ShowSnakBar(
            context,
            title: 'Success',
            iconData: Icons.info_outline_rounded,
            messageTextStyle:
                TextStyles.text_16.copyWith(fontWeight: FontWeight.bold),
            content: dataDeoded['message'],
            subtitleTextStyle: TextStyles.text_16,
            backGroundColor: ColorApp.secunderyColorDark,
          );
        } else {
          emit(SellYouPlateState.faliure(dataDeoded['message']));
          ShowSnakBar(
            context,
            title: 'Failure',
            iconData: Icons.info_outline_rounded,
            messageTextStyle:
                TextStyles.text_16.copyWith(fontWeight: FontWeight.bold),
            content: dataDeoded['message'],
            subtitleTextStyle: TextStyles.text_16,
            backGroundColor: ColorApp.secunderyColorDark,
          );
        }
      },
      failure: (error) {
        emit(const SellYouPlateState.faliure(
            'There Unkwon Error We Try To Fix It Soon!'));
      },
    );
  }
}
