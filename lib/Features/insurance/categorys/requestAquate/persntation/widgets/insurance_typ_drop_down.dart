import 'package:flutter/material.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/style/text_style.dart';

class InsuranceTypeDropDown extends StatefulWidget {
  final void Function(String?)? onChanged;

  const InsuranceTypeDropDown({Key? key, this.onChanged}) : super(key: key);

  @override
  _InsuranceTypeDropDownState createState() => _InsuranceTypeDropDownState();
}

class _InsuranceTypeDropDownState extends State<InsuranceTypeDropDown> {
  String? _selectedCylinder;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      hint: Text(
        "Insurance Type",
        style: TextStyles.text_14,
      ),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorApp.primeryColorDark),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorApp.primeryColorDark),
        ),
        prefixIcon: const Icon(Icons.published_with_changes_sharp),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        floatingLabelAlignment: FloatingLabelAlignment.start,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelStyle: TextStyles.text_12.copyWith(color: Colors.white),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        labelText: 'Insurance Type',
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
      items:
          insuranceTypeListData.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

List<String> insuranceTypeListData = [
  'Against other',
  'Full',
];
