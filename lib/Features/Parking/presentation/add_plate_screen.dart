import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mowaterApp/Features/Parking/data/plateService/plate_service.dart';
import 'package:mowaterApp/Features/Parking/models/plate_model.dart';
import 'package:mowaterApp/Features/Parking/presentation/widgets/add_new_plate_widget.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/constants/size.dart';
import 'package:mowaterApp/core/style/text_style.dart';
import 'package:mowaterApp/core/widgets/button.dart';
import 'package:mowaterApp/core/widgets/snak_bar.dart';
import 'package:mowaterApp/core/widgets/text_form_fiedl.dart';

class AddNewPlateScreen extends StatefulWidget {
  const AddNewPlateScreen({Key? key}) : super(key: key);

  @override
  _AddNewPlateScreenState createState() => _AddNewPlateScreenState();
}

class _AddNewPlateScreenState extends State<AddNewPlateScreen> {
  String selectedValue = "Dubai";

  TextEditingController carAliasController = TextEditingController();
  TextEditingController plateNumberController = TextEditingController();
  TextEditingController plateSourceController = TextEditingController();
  TextEditingController plateCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Add New Plate",
            style: TextStyles.text_18,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(mainPadding.dg),
          child: Column(
            children: [
              CustomTextFormField(
                controller: carAliasController,
                hintText: 'Car Alias',
              ),
              SizedBox(height: 20.h),
              BuildAddPlateWidget(
                plateNumberController: plateNumberController,
                selectedValue: selectedValue,
                onPlateCodeChanged: (p0) {
                  print(selectedValue);
                  plateCodeController.text = p0!;
                },
              ),
              verticalSpace(50.h),
              CustomButton(
                padding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 10),
                onPressed: _submitForm,
                color: ColorApp.primeryColorDark,
                textStyle: TextStyles.text_20.copyWith(color: Colors.white),
                text: "Add Plate",
              )
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    String carAlias = carAliasController.text;
    String plateNumber = plateNumberController.text;
    String plateSource = selectedValue;
    String plateCode = plateCodeController.text;

    if (plateNumber.isNotEmpty) {
      try {
        PlateService.addPlate(
          PlateModel(
            lastUse: DateTime.now(),
            nickName: carAlias,
            plateNumber: plateNumber,
            plateSource: plateSource,
            plateCode: plateCode,
          ),
        );
        ShowSnakBar(
          context,
          title: 'Success',
          iconData: Icons.info_outline_rounded,
          messageTextStyle:
              TextStyles.text_16.copyWith(fontWeight: FontWeight.bold),
          content: "New Plate Added Successfuly!",
          subtitleTextStyle: TextStyles.text_16,
          backGroundColor: ColorApp.secunderyColorDark,
        );
        plateCodeController.clear();
        plateNumberController.clear();
        plateSourceController.clear();
        carAliasController.clear();
        selectedValue = 'Dubai';
        setState(() {});
      } catch (e) {
        ShowSnakBar(
          context,
          title: 'Failure',
          iconData: Icons.info_outline_rounded,
          messageTextStyle:
              TextStyles.text_16.copyWith(fontWeight: FontWeight.bold),
          content: 'There Was Unkown Error Well Fix It Soon!',
          subtitleTextStyle: TextStyles.text_16,
          backGroundColor: ColorApp.secunderyColorDark,
        );
      }
    } else {
      ShowSnakBar(
        context,
        title: 'Failure',
        iconData: Icons.info_outline_rounded,
        messageTextStyle:
            TextStyles.text_16.copyWith(fontWeight: FontWeight.bold),
        content: 'Please Add Plate Information!',
        subtitleTextStyle: TextStyles.text_16,
        backGroundColor: ColorApp.secunderyColorDark,
      );
    }
  }
}
