import 'package:flutter/material.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/style/text_style.dart';

class YearDropdown extends StatefulWidget {
  final int initialValue;
  final Function(int) onChanged;

  const YearDropdown({
    Key? key,
    required this.initialValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  _YearDropdownState createState() => _YearDropdownState();
}

class _YearDropdownState extends State<YearDropdown> {
  late int _selectedYear;

  @override
  void initState() {
    super.initState();
    _selectedYear = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    final int currentYear = DateTime.now().year;

    return DropdownButtonFormField<int>(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorApp.primeryColorDark),
          borderRadius: BorderRadius.circular(8), // Add border radius
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorApp.primeryColorDark),
          borderRadius: BorderRadius.circular(8), // Add border radius
        ),
        prefixIcon: const Icon(Icons.calendar_month_outlined),
        floatingLabelAlignment: FloatingLabelAlignment.start,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelStyle: TextStyles.text_14.copyWith(color: Colors.white),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        labelText: 'Year',
        labelStyle: TextStyles.text_14,
        hintStyle: const TextStyle(color: Colors.white),
      ),
      value: _selectedYear,
      onChanged: (value) {
        setState(() {
          widget.onChanged(value!);
        });
      },
      items: List<DropdownMenuItem<int>>.generate(
        currentYear - 1970,
        (index) => DropdownMenuItem<int>(
          value: currentYear - index,
          child: Text(
            (currentYear - index).toString(),
            style: TextStyles.text_14,
          ),
        ),
      ),
    );
  }
}
