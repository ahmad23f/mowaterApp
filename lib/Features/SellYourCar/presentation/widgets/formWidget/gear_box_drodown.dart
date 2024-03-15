import 'package:flutter/material.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/style/text_style.dart';

class GearBoxDropdown extends StatefulWidget {
  final void Function(String?)? onChanged;

  const GearBoxDropdown({Key? key, this.onChanged}) : super(key: key);

  @override
  _GearBoxDropdownState createState() => _GearBoxDropdownState();
}

class _GearBoxDropdownState extends State<GearBoxDropdown> {
  String? _selectedLocation;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      hint: Text(
        "Gear Box",
        style: TextStyles.text_14,
      ),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorApp.primeryColorDark),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorApp.primeryColorDark),
        ),
        prefixIcon: const Icon(Icons.account_tree_outlined),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        floatingLabelAlignment: FloatingLabelAlignment.start,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelStyle: TextStyles.text_14.copyWith(color: Colors.white),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        labelText: 'Gear Box',
        labelStyle: TextStyles.text_14,
        hintStyle: const TextStyle(color: Colors.white),
      ),
      isExpanded: true,
      value: _selectedLocation,
      onChanged: (String? newValue) {
        setState(() {
          _selectedLocation = newValue;
        });
        widget.onChanged?.call(newValue);
      },
      items: gearBoxTypes.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

List<String> gearBoxTypes = ['Automatic', 'Manual'];
