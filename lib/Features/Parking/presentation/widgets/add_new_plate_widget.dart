import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mowaterApp/Features/Parking/data/image_principality.dart';
import 'package:mowaterApp/Features/Parking/data/plate_code_country.dart';
import 'package:mowaterApp/Features/Parking/presentation/widgets/add_new_plate_code.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/constants/size.dart';
import 'package:mowaterApp/core/style/text_style.dart';

class BuildAddPlateWidget extends StatefulWidget {
  final TextEditingController plateNumberController;
  String selectedValue;
  final Function(String?) onPlateCodeChanged;

  BuildAddPlateWidget({
    Key? key,
    required this.plateNumberController,
    required this.selectedValue,
    required this.onPlateCodeChanged,
  }) : super(key: key);

  @override
  State<BuildAddPlateWidget> createState() => _BuildAddPlateWidgetState();
}

class _BuildAddPlateWidgetState extends State<BuildAddPlateWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 350.w,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(88, 255, 255, 255),
                spreadRadius: 0.04,
                blurRadius: 10,
              )
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.black, width: 6),
          ),
          height: 110.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 90.w,
                child: AddNewPlateCode(
                  textStyle: TextStyles.text_12.copyWith(
                      color: ColorApp.primeryColorDark, fontSize: 16.sp),
                  onChanged: widget.onPlateCodeChanged,
                  defultName: 'Plate code',
                  data: getCodesByCountryName(widget.selectedValue),
                  width: 100.w,
                ),
              ),
              GestureDetector(
                onTap: () {
                  showMenu(
                    context: context,
                    position: RelativeRect.fromLTRB(150.dg, 280.h, 100.w, 0),
                    items: itemImages.keys.map((String value) {
                      return PopupMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ).then((selectedValue) {
                    if (selectedValue != null) {
                      setState(() {
                        print(selectedValue);
                        widget.selectedValue = selectedValue;
                      });
                    }
                  });
                },
                child: Container(
                  height: 110.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: widget.selectedValue != null
                      ? Image.asset(
                          itemImages[widget.selectedValue]!,
                        )
                      : const SizedBox(), // Placeholder icon
                ),
              ),
              horizontalSpace(10.w),
              SizedBox(
                width: 120.w,
                child: TextFormField(
                  controller: widget.plateNumberController,
                  cursorColor: Colors.black,
                  maxLength: 5,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        style: BorderStyle.none,
                      ),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black, // Change the underline color here
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  style: TextStyles.text_30.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
