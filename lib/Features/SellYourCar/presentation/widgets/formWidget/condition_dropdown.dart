import 'package:flutter/material.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/style/text_style.dart';

class ConditionDropDown extends StatefulWidget {
  final void Function(String?)? onChanged;

  const ConditionDropDown({Key? key, this.onChanged}) : super(key: key);

  @override
  _ConditionDropDownState createState() => _ConditionDropDownState();
}

class _ConditionDropDownState extends State<ConditionDropDown> {
  String? _selectedCylinder; // Define _selectedCylinder here

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      hint: Text(
        "condition",
        style: TextStyles.text_14,
      ),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorApp.primeryColorDark),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorApp.primeryColorDark),
        ),
        prefixIcon: const Icon(Icons.assignment),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        floatingLabelAlignment: FloatingLabelAlignment.start,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelStyle: TextStyles.text_14.copyWith(color: Colors.white),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        labelText: 'condition',
        labelStyle: TextStyles.text_14,
        hintStyle: const TextStyle(color: Colors.white),
      ),
      isExpanded: true,
      value: _selectedCylinder,
      onChanged: (String? newValue) {
        setState(() {
          _selectedCylinder = newValue;
        });
        widget.onChanged?.call(newValue);
      },
      items: conditionListData.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: SizedBox(
            child: Text(value),
          ),
        );
      }).toList(),
    );
  }
}

List<String> conditionListData = [
  'Good',
  'V. Good',
  'Excellent',
];
