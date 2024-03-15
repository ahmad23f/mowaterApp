import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Category {
  final int id;
  final String name;

  Category(this.id, this.name);
}

class SpecialtyDropDown extends StatefulWidget {
  final ValueChanged<int>? onCategoryChanged;
  final ValueChanged<List<String>>? onSpecialtiesChanged;

  const SpecialtyDropDown({
    Key? key,
    this.onCategoryChanged,
    this.onSpecialtiesChanged,
  }) : super(key: key);

  @override
  _SpecialtyDropDownState createState() => _SpecialtyDropDownState();
}

class _SpecialtyDropDownState extends State<SpecialtyDropDown> {
  final _formKey = GlobalKey<FormState>();

  List<Category> mainCategories = [
    Category(1, 'Maintenance'.tr()), //
    Category(2, 'showRooms'.tr()), //
    Category(3, 'insurance'.tr()), //
    Category(4, 'rentalCars'.tr()),
    Category(5, 'warranty'.tr()), //
    Category(6, 'Evaluation'.tr()), //
    Category(7, 'spareParts'.tr()),
    Category(8, 'inspection'.tr()), //
    Category(9, 'carCare'.tr()),
    Category(10, 'mobileService'.tr()),
    // Add more main categories as needed
  ];

  // Map of main categories to specialties
  Map<String, List<String>> specialties = {
    'Maintenance'.tr(): [
      'Engines'.tr(),
      'Electrical'.tr(),
      'Mechanical'.tr(),
      'Brake'.tr(),
      'Ac'.tr(),
      "Gear".tr(),
      'Glass'.tr(),
      'Oil'.tr(),
      'Tires'.tr(),
      "programing".tr(),
      'Dyeing And Plumbing'.tr(),
      ' Rediators or Exhaust'.tr()
    ],
    'showRooms'.tr(): [],
    'insurance'.tr(): [
      'Company'.tr(),
      'Broker'.tr(),
    ],
    'Evaluation'.tr(): [],
    'rentalCars'.tr(): [],
    'warranty'.tr(): [],
    'spareParts'.tr(): [
      'Steering'.tr(),
      'Gera'.tr(),
      'Engine'.tr(),
      'Suspensio'.tr(),
      'Fuel System'.tr(),
      'Lighting Or Electrical'.tr(),
      'Tires'.tr(),
      'Colling Or Heating'.tr(),
      'Air System'.tr(),
      'Interior Parts'.tr(),
      'Oil Or Filters'.tr(),
      'Batteries'.tr(),
      'Car Glass'.tr(),
      'Exhaust'.tr(),
      'Chassis Or Body'.tr(),
    ],
    'inspection'.tr(): [],
    'carCare'.tr(): [
      'Glass Shading'.tr(),
      'Car Polish'.tr(),
      'Car Wash'.tr(),
      'Accessories'.tr(),
      'Car Wraps'.tr(),
      'Keys or Remotes'.tr(),
      'Interior Washing'.tr(),
      'Car Upholstery'.tr(),
      'Lights Polishing'.tr(),
      'Engine Protection'.tr(),
      'Car Body Protections'.tr(),
      'Paint Protection'.tr(),
    ],
    'mobileService'.tr(): [
      'Tiers'.tr(),
      'Battery'.tr(),
      'Recovery'.tr(),
      'Electric Charger'.tr(),
    ]
  };

  int? selectedCategoryIndex;
  List<String> selectedSpecialtyIndices = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButtonFormField<Category>(
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
              padding: EdgeInsets.only(left: 8.0.w),
              child: Text(
                'Select Provider Type'.tr(),
                style: const TextStyle(fontSize: 14),
              ),
            ),
            value: selectedCategoryIndex != null
                ? mainCategories[selectedCategoryIndex!]
                : null,
            items: mainCategories
                .map((item) => DropdownMenuItem<Category>(
                      value: item,
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.0.w),
                        child: Text(
                          item.name,
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
                selectedSpecialtyIndices
                    .clear(); // Reset specialties on category change
                if (widget.onCategoryChanged != null) {
                  widget.onCategoryChanged!(value.id); // Pass the category ID
                }
              });
            },
          ),
          const SizedBox(height: 16), // Add spacing between dropdowns
          if (selectedCategoryIndex != null)
            Wrap(
              spacing: 8,
              children:
                  specialties[mainCategories[selectedCategoryIndex!].name]!
                      .asMap()
                      .entries
                      .map((entry) {
                final index = entry.key;
                final specialty = entry.value;
                return Padding(
                  padding: const EdgeInsets.only(
                      right: 8), // Add padding to the right
                  child: FilterChip(
                    label: Text(specialty),
                    selected: selectedSpecialtyIndices
                        .contains(index.toString()), // Convert index to string
                    onSelected: (isSelected) {
                      setState(() {
                        if (isSelected) {
                          selectedSpecialtyIndices.add(index.toString());
                        } else {
                          selectedSpecialtyIndices.remove(index.toString());
                        }
                        if (widget.onSpecialtiesChanged != null) {
                          widget
                              .onSpecialtiesChanged!(selectedSpecialtyIndices);
                        }
                      });
                    },
                  ),
                );
              }).toList(),
            ),
        ],
      ),
    );
  }
}
