import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/routing/routing_name.dart';
import 'package:Mowater/core/style/text_style.dart';

class ParkingNumberCar extends StatelessWidget {
  const ParkingNumberCar({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: Theme.of(context).colorScheme.secondary,
      child: Text(
        'Parking Cars'.tr(),
        style: TextStyles.text_18.copyWith(color: Colors.white),
      ),
      onPressed: () {
        context.push(RouteName.platesScreen);
      },
    );
  }
}
