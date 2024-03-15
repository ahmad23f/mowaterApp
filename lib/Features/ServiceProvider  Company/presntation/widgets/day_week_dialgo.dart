import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DayWeekDialog extends StatefulWidget {
  const DayWeekDialog({super.key});

  @override
  _DayWeekDialogState createState() => _DayWeekDialogState();
}

class _DayWeekDialogState extends State<DayWeekDialog> {
  List<String> selectedDays = [];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:  Text('Select Days of Availability'.tr()),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildDayCheckbox('Monday'.tr()),
          _buildDayCheckbox('Tuesday'.tr()),
          _buildDayCheckbox('Wednesday'.tr()),
          _buildDayCheckbox('Thursday'.tr()),
          _buildDayCheckbox('Friday'.tr()),
          _buildDayCheckbox('Saturday'.tr()),
          _buildDayCheckbox('Sunday'.tr()),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(selectedDays);
          },
          child:  Text('Done'.tr()),
        ),
      ],
    );
  }

  Widget _buildDayCheckbox(String day) {
    return CheckboxListTile(
      title: Text(day),
      value: selectedDays.contains(day),
      onChanged: (bool? value) {
        setState(() {
          if (value != null && value) {
            selectedDays.add(day);
          } else {
            selectedDays.remove(day);
          }
        });
      },
    );
  }
}
