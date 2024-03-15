import 'package:flutter/material.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/style/text_style.dart';

class DoorsDropDown extends StatefulWidget {
  final void Function(int?)? onChanged;

  const DoorsDropDown({Key? key, this.onChanged}) : super(key: key);

  @override
  _DoorsDropDownState createState() => _DoorsDropDownState();
}

class _DoorsDropDownState extends State<DoorsDropDown> {
  int? _selectedDoor;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<int>(
      hint: Text(
        "Doors",
        style: TextStyles.text_14,
      ),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorApp.primeryColorDark),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorApp.primeryColorDark),
        ),
        prefix: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Image.asset(
            'assets/images/carDoorIcon.png',
            height: 20,
            width: 20,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        floatingLabelAlignment: FloatingLabelAlignment.start,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelStyle: TextStyles.text_14.copyWith(color: Colors.white),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        labelText: 'Doors',
        labelStyle: TextStyles.text_14,
        hintStyle: const TextStyle(color: Colors.white),
      ),
      isExpanded: true,
      value: _selectedDoor,
      onChanged: (int? newValue) {
        setState(() {
          _selectedDoor = newValue!;
        });
        widget.onChanged?.call(newValue);
      },
      items: DoorsDataList.map<DropdownMenuItem<int>>((int value) {
        return DropdownMenuItem<int>(
          value: value,
          child: Text(value.toString()),
        );
      }).toList(),
    );
  }
}

List<int> DoorsDataList = [1, 2, 3, 4, 5, 6, 7, 8];
