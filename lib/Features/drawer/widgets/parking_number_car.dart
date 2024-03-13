import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/routing/routing_name.dart';
import 'package:mowaterApp/core/style/text_style.dart';

class ParkingNumberCar extends StatelessWidget {
  const ParkingNumberCar({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: ColorApp.secunderyColorDark,
      child: Text(
        'Parking Cars',
        style: TextStyles.text_18.copyWith(color: Colors.white),
      ),
      onPressed: () {
        context.push(RouteName.platesScreen);
      },
    );
  }
}
