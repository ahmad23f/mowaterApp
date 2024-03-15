import 'package:flutter/material.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/style/text_style.dart';

class SpecificationsDropdown extends StatefulWidget {
  final void Function(String?)? onChanged;

  const SpecificationsDropdown({Key? key, this.onChanged}) : super(key: key);

  @override
  _SpecificationsDropdownState createState() => _SpecificationsDropdownState();
}

class _SpecificationsDropdownState extends State<SpecificationsDropdown> {
  String? _selectedCylinder;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      hint: Text(
        "Specifications",
        style: TextStyles.text_14,
      ),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorApp.primeryColorDark),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorApp.primeryColorDark),
        ),
        prefixIcon: const Icon(Icons.today_outlined),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        floatingLabelAlignment: FloatingLabelAlignment.start,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelStyle: TextStyles.text_12.copyWith(color: Colors.white),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        labelText: 'Specifications',
        labelStyle: const TextStyle(color: Colors.white),
        hintStyle: const TextStyle(color: Colors.white),
      ),
      value: _selectedCylinder,
      onChanged: (String? newValue) {
        setState(() {
          _selectedCylinder = newValue;
        });
        widget.onChanged?.call(newValue);
      },
      items: specifications.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

List<String> specifications = [
  'Imported',
  'GCC',
];
