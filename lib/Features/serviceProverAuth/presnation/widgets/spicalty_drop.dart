import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mowaterApp/core/constants/color.dart';

class SignInCategoryDropDown extends StatefulWidget {
  final ValueChanged<String>? onCategoryChanged;

  const SignInCategoryDropDown({
    Key? key,
    this.onCategoryChanged,
  }) : super(key: key);

  @override
  _SignInCategoryDropDownState createState() => _SignInCategoryDropDownState();
}

class _SignInCategoryDropDownState extends State<SignInCategoryDropDown> {
  final _formKey = GlobalKey<FormState>();

  // List of main categories
  List<String> mainCategories = [
    'Maintenance',
    'showRooms',
    'insurance',
    'rentalCars',
    'warranty',
    'spareParts',
    'inspection',
    'Evaluation',
    'carCare',
    'mobileService',
    // Add more main categories as needed
  ];

  int? selectedCategoryIndex;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButtonFormField<String>(
            isExpanded: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: ColorApp.secunderyColorDark,
              contentPadding: const EdgeInsets.symmetric(vertical: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
            hint: Padding(
              padding: EdgeInsets.only(left: 12.0.w),
              child: const Text(
                'Select Provider Type',
                style: TextStyle(fontSize: 14),
              ),
            ),
            value: selectedCategoryIndex != null
                ? mainCategories[selectedCategoryIndex!]
                : null,
            items: mainCategories
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.0.w),
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedCategoryIndex = mainCategories.indexOf(value!);
                if (widget.onCategoryChanged != null) {
                  widget.onCategoryChanged!(value); // Pass the category name
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
