import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Mowater/core/style/text_style.dart';

class AddNewPlateCode extends StatefulWidget {
  final List<String> data;
  final String defultName;
  final double width;
  final Function(String?)? onChanged;
  TextStyle? textStyle = TextStyle(
    fontSize: 14.sp,
  );
  AddNewPlateCode({
    Key? key,
    required this.data,
    required this.defultName,
    required this.width,
    required this.onChanged,
    this.textStyle,
  }) : super(key: key);

  @override
  State<AddNewPlateCode> createState() => _AddNewPlateCodeState();
}

class _AddNewPlateCodeState extends State<AddNewPlateCode> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Text(
          widget.defultName,
          style:
              widget.textStyle ?? TextStyles.text_26.copyWith(fontSize: 26.sp),
        ),
        items: widget.data.map((item) {
          bool isSelected = item == selectedValue;
          return DropdownMenuItem(
            value: item,
            child: Text(
              item,
              style: isSelected
                  ? TextStyle(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.bold,
                    )
                  : TextStyle(
                      fontSize: 30.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
            ),
          );
        }).toList(),
        value: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value;
          });
          // Call the onChanged callback with the selected value
          if (widget.onChanged != null) {
            widget.onChanged!(value);
          }
        },
        style: TextStyles.text_32.copyWith(
          fontSize: 32.sp,
          fontWeight: FontWeight.bold,
        ),
        buttonStyleData: ButtonStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          height: 40.h,
          width: widget.width.w,
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          maxHeight: 300.h,
        ),
        menuItemStyleData: MenuItemStyleData(
          height: 40.h,
        ),
        //This to clear the search value when you close the menu
        onMenuStateChange: (isOpen) {
          if (!isOpen) {
            // Do any cleanup here if needed
          }
        },
      ),
    );
  }
}
