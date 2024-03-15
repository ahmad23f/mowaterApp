import 'package:flutter/material.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/style/text_style.dart';

class RegionalSpecsDropDown extends StatefulWidget {
  final void Function(String?)? onChanged;

  const RegionalSpecsDropDown({Key? key, this.onChanged}) : super(key: key);

  @override
  _RegionalSpecsDropDownState createState() => _RegionalSpecsDropDownState();
}

class _RegionalSpecsDropDownState extends State<RegionalSpecsDropDown> {
  String? _selectedCylinder; // Define _selectedCylinder here

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      hint: Text(
        "regional Spec",
        style: TextStyles.text_14,
      ),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorApp.primeryColorDark),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorApp.primeryColorDark),
        ),
        prefixIcon: const Icon(Icons.map_outlined),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        floatingLabelAlignment: FloatingLabelAlignment.start,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelStyle: TextStyles.text_14.copyWith(color: Colors.white),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        labelText: 'regional Spec',
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
      items:
          regionalSpecsDataList.map<DropdownMenuItem<String>>((String value) {
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

List<String> regionalSpecsDataList = [
  'GCC Specs',
  'American Specs',
  'Canadian Specs',
  'Europen Specs',
  'Japanese Specs',
  'Korean Specs',
  'Chinese Specs',
  'Other ',
];
