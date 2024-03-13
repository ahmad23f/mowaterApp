import 'package:flutter/material.dart';

TimeOfDay stringToTimeOfDay(String timeString) {
  final parts = timeString.split(':');
  final int hours = int.parse(parts[0]);
  final int minutes = int.parse(parts[1].split(" ")[0]); // Remove AM/PM part
  return TimeOfDay(hour: hours, minute: minutes);
}
