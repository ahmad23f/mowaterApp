import 'package:flutter/material.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/style/text_style.dart';

class CylindersDropdown extends StatefulWidget {
  final void Function(String?)? onChanged;

  const CylindersDropdown({Key? key, this.onChanged}) : super(key: key);

  @override
  _CylindersDropdownState createState() => _CylindersDropdownState();
}

class _CylindersDropdownState extends State<CylindersDropdown> {
  String? _selectedCylinder;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      isExpanded: true, // Set isExpanded to true
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorApp.primeryColorDark),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorApp.primeryColorDark),
        ),
        prefixIcon: const Icon(Icons.candlestick_chart_outlined),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        floatingLabelAlignment: FloatingLabelAlignment.start,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelStyle: TextStyles.text_14.copyWith(color: Colors.white),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        labelText: 'Cylinders',
        labelStyle: const TextStyle(color: Colors.white),
        hintStyle: const TextStyle(color: Colors.white),
      ),
      hint: Text(
        'cylinders',
        style: TextStyles.text_14,
      ),
      value: _selectedCylinder,
      onChanged: (String? newValue) {
        setState(() {
          _selectedCylinder = newValue;
        });
        // Call the onChanged callback with the new value
        widget.onChanged?.call(newValue);
      },
      items: cylindersListData.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

List<String> cylindersListData = [
  '3',
  '4',
  '5',
  '6',
  '8',
  '12',
];
