import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class UsedSparePartsScreen extends StatelessWidget {
  const UsedSparePartsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [Text('UsedSparePartsScreen'.tr())],
      ),
    );
  }
}
