import 'package:flutter/material.dart';

class DayWeekDialog extends StatefulWidget {
  final List<String> initialSelectedDays;

  const DayWeekDialog({Key? key, required this.initialSelectedDays})
      : super(key: key);

  @override
  _DayWeekDialogState createState() => _DayWeekDialogState();
}

class _DayWeekDialogState extends State<DayWeekDialog> {
  late List<String> selectedDays;

  @override
  void initState() {
    super.initState();
    selectedDays = List<String>.from(widget.initialSelectedDays);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Days of Availability'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildDayCheckbox('Monday'),
          _buildDayCheckbox('Tuesday'),
          _buildDayCheckbox('Wednesday'),
          _buildDayCheckbox('Thursday'),
          _buildDayCheckbox('Friday'),
          _buildDayCheckbox('Saturday'),
          _buildDayCheckbox('Sunday'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(selectedDays);
          },
          child: const Text('Done'),
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
