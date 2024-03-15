import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/style/text_style.dart';
import 'package:Mowater/core/widgets/button.dart';

class ChipChoiceEmaraa extends StatefulWidget {
  const ChipChoiceEmaraa({
    super.key,
  });

  @override
  _ChipChoiceEmaraaState createState() => _ChipChoiceEmaraaState();
}

class _ChipChoiceEmaraaState extends State<ChipChoiceEmaraa> {
  List<String> selectedEmirates = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Emirate Filter',
          style: TextStyles.text_18.copyWith(fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: List<Widget>.generate(
                emirates.length,
                (int index) {
                  return FilterChip(
                    label: Text(emirates[index]),
                    selected: selectedEmirates.contains(emirates[index]),
                    onSelected: (bool selected) {
                      setState(() {
                        if (selected) {
                          selectedEmirates.add(emirates[index]);
                        } else {
                          selectedEmirates.remove(emirates[index]);
                        }
                      });
                    },
                  );
                },
              ).toList(),
            ),
            const Divider(),
            Center(
              child: CustomButton(
                  padding:
                      EdgeInsets.symmetric(horizontal: 100.h, vertical: 10),
                  onPressed: () {
                    context.pop();
                  },
                  color: ColorApp.primeryColorDark,
                  textStyle: TextStyles.text_18.copyWith(color: Colors.white),
                  text: 'Apply'),
            )
          ],
        ),
      ),
    );
  }
}

List<String> emirates = [
  'Abu Dhabi',
  'Dubai',
  'Umm Al-Quwain',
  'Sharjah',
  'Ajman',
  'Fujairah',
  'Ras Al Khaimah',
];
