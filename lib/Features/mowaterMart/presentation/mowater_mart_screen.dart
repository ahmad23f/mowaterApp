import 'package:flutter/material.dart';
import 'package:mowaterApp/Features/mowaterMart/presentation/widget/mowater_mart_body.dart';

class MowaterMartScreen extends StatefulWidget {
  const MowaterMartScreen({Key? key}) : super(key: key);

  @override
  _MowaterMartScreenState createState() => _MowaterMartScreenState();
}

class _MowaterMartScreenState extends State<MowaterMartScreen> {
  int? selectedCarId;

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(child: MowaterMartBody()),
      ],
    );
  }
}
