import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SpearPartsScreen extends StatelessWidget {
  const SpearPartsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Text('spaer parts'.tr()),
        ],
      ),
    );
  }
}
