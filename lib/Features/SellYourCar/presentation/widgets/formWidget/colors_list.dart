import 'package:flutter/material.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/style/text_style.dart';

class ColorDropdown extends StatefulWidget {
  void Function(String?)? onChanged;

  bool? isInteriorColor = false;
  ColorDropdown({super.key, this.isInteriorColor, this.onChanged});

  @override
  _ColorDropdownState createState() => _ColorDropdownState();
}

class _ColorDropdownState extends State<ColorDropdown> {
  String _selectedColor = 'Red'; // Default selected color

  final Map<String, Color> _colorMap = {
    'Olive': const Color.fromARGB(255, 25, 129, 56),
    'Navy': const Color.fromARGB(255, 81, 81, 81),
    'Yellow': Colors.yellow,
    'White': Colors.white,
    'silver': const Color.fromARGB(255, 167, 167, 167),
    'Red': Colors.red,
    'Green': Colors.green,
    'Golden': const Color.fromARGB(255, 255, 230, 0),
    'Blue': Colors.blue,
    'Black': Colors.black,
  }; // Map of colors

  final List<String> _colors = [
    'Olive',
    'Navy',
    'Yellow',
    'White',
    'silver',
    'Red',
    'Golden',
    'Blue',
    'Black',
  ]; // List of colors

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      hint: Text(
        widget.isInteriorColor! ? "Interior Color" : "Exterior Color",
        style: TextStyles.text_14,
      ),
      isExpanded: true,
      value: _selectedColor,
      onChanged: (String? newValue) {
        setState(() {
          _selectedColor = newValue!;
        });
        widget.onChanged?.call(newValue);
      },
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorApp.primeryColorDark),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorApp.primeryColorDark),
        ),
        prefixIcon: const Icon(Icons.brush_outlined),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        floatingLabelAlignment: FloatingLabelAlignment.start,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelStyle: TextStyles.text_14.copyWith(color: Colors.white),
        labelText:
            widget.isInteriorColor! ? "Interior Color" : "Exterior Color",
        labelStyle: TextStyles.text_14,
        hintStyle: const TextStyle(color: Colors.white),
      ),
      items: _colors.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Container(
            decoration: BoxDecoration(
                color: _colorMap[value], // Set background color dynamically

                borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                textAlign: TextAlign.center,
                value,
                style: value != 'Black'
                    ? TextStyles.text_12.copyWith(color: Colors.black)
                    : TextStyles.text_12.copyWith(color: Colors.white),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
