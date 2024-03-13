import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/style/text_style.dart';

class PriceSlider extends StatefulWidget {
  const PriceSlider({super.key});

  @override
  _PriceSliderState createState() => _PriceSliderState();
}

class _PriceSliderState extends State<PriceSlider> {
  RangeValues currentSliderValue = const RangeValues(0, 700000);

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        valueIndicatorColor: ColorApp.primeryColorDark,
        valueIndicatorTextStyle: TextStyles.text_12,
      ),
      child: RangeSlider(
        activeColor: ColorApp.secunderyColorDark,
        inactiveColor:
            ColorApp.primeryColorDark, // Change inactive line color to blue
        values: currentSliderValue,
        min: 0,
        max: 700000,
        divisions: 70,
        labels: RangeLabels(
          NumberFormat('#,###')
              .format(currentSliderValue.start.round())
              .toString(),
          NumberFormat('#,###')
              .format(currentSliderValue.end.round())
              .toString(),
        ),
        onChanged: (values) => setState(() => currentSliderValue = values),
      ),
    );
  }
}
