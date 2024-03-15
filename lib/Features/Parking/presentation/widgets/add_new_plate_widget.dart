import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Mowater/Features/Parking/data/image_principality.dart';
import 'package:Mowater/Features/Parking/presentation/widgets/add_new_plate_code.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/style/text_style.dart';

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
            border: Border.all(width: 6),
          ),
          height: 110.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 90.w,
                child: AddNewPlateCode(
                  textStyle: TextStyles.text_16
                      .copyWith(color: ColorApp.primeryColorDark),
                  onChanged: widget.onPlateCodeChanged,
                  defultName: 'Plate code',
                  data: const ['1', '2'],
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
                  maxLength: 5,
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        style: BorderStyle.none,
                      ),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .color!, // Change the underline color here
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  style: TextStyles.text_30.copyWith(
                    fontWeight: FontWeight.bold,
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
