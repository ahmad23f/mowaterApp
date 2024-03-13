import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/constants/size.dart';

class ParkingTypeLine extends StatelessWidget {
  const ParkingTypeLine({
    Key? key,
    required this.selectedParkingZone,
  }) : super(key: key);

  final String selectedParkingZone;

  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(153, 255, 255, 255),
            spreadRadius: 0.01,
            blurRadius: 6,
          )
        ],
        border: Border.all(
          color: ColorApp.secunderyColorDark,
          width: 2.5,
        ),
      ),
      height: 20.h,
      width: mediasize(context).width,
      child: Row(
        children: buildParkingContainers(),
      ),
    );
  }

  List<Widget> buildParkingContainers() {
    final List<Widget> containers = [];
    for (int i = 0; i < 7; i++) {
      final color = selectedParkingZone == 'Premium'
          ? (i % 2 == 0
              ? const Color.fromARGB(255, 0, 62, 113)
              : Colors.transparent)
          : (i % 2 == 0 ? const Color.fromARGB(255, 0, 62, 113) : Colors.black);
      containers.add(
        Expanded(
          child: Container(
            color: color,
          ),
        ),
      );
    }
    return containers;
  }
}
