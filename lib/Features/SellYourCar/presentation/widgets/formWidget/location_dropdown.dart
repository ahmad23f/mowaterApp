import 'package:flutter/material.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/style/text_style.dart';

class LocationDropDown extends StatefulWidget {
  final void Function(String?)? onChanged;
  final List<String>? listData;
  const LocationDropDown({Key? key, this.onChanged, this.listData})
      : super(key: key);

  @override
  _LocationDropDownState createState() => _LocationDropDownState();
}

class _LocationDropDownState extends State<LocationDropDown> {
  String? _selectedLocation;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      hint: Text(
        "Location",
        style: TextStyles.text_14,
      ),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorApp.primeryColorDark),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorApp.primeryColorDark),
        ),
        prefixIcon: const Icon(Icons.location_on_outlined),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        floatingLabelAlignment: FloatingLabelAlignment.start,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelStyle: TextStyles.text_14.copyWith(color: Colors.white),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        labelText: 'Location',
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
      items: (widget.listData ?? locationListdata)
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

List<String> locationListdata = [
  'Abu Dhabi',
  'Dubai',
  'Sharjah',
  'Ajman',
  'UAQ',
  'RAK',
  'Al Fujairah',
  'Al Ain',
  'Western Region',
  'Kalba',
  'Khor Fakkan',
  'Diba Al Hisn',
  'Hatta',
];
