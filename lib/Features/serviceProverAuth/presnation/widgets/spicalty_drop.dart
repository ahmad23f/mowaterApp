import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Mowater/core/constants/color.dart';

class SignInCategoryDropDown extends StatefulWidget {
  final ValueChanged<int>? onCategoryIndexChanged; // Change the callback type

  const SignInCategoryDropDown({
    Key? key,
    this.onCategoryIndexChanged,
  }) : super(key: key);

  @override
  _SignInCategoryDropDownState createState() => _SignInCategoryDropDownState();
}

class _SignInCategoryDropDownState extends State<SignInCategoryDropDown> {
  final _formKey = GlobalKey<FormState>();

  // List of main categories
  List<String> mainCategories = [
    'Maintenance'.tr(),
    'showRooms'.tr(),
    'insurance'.tr(),
    'rentalCars'.tr(),
    'warranty'.tr(),
    'spareParts'.tr(),
    'inspection'.tr(),
    'Evaluation'.tr(),
    'carCare'.tr(),
    'mobileService'.tr(),
    // Add more main categories as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButtonFormField<int>(
            // Change to int type
            isExpanded: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).colorScheme.secondary,
              contentPadding: const EdgeInsets.symmetric(vertical: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
            hint: Padding(
              padding: EdgeInsets.only(left: 12.0.w),
              child: Text(
                'Select Provider Type'.tr(),
                style: const TextStyle(fontSize: 14),
              ),
            ),
            value: null,
            items: mainCategories.asMap().entries.map((entry) {
              // Map with index
              int index = entry.key;
              String item = entry.value;
              return DropdownMenuItem<int>(
                value: index,
                child: Padding(
                  padding: EdgeInsets.only(left: 8.0.w),
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              );
            }).toList(),
            onChanged: (value) {
              if (widget.onCategoryIndexChanged != null) {
                widget.onCategoryIndexChanged!(
                    value! + 1); // Pass the index value
              }
            },
          ),
        ],
      ),
    );
  }
}
