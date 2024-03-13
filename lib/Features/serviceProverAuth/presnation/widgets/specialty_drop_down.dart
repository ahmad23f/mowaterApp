import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mowaterApp/core/constants/color.dart';

class SpecialtyDropDown extends StatefulWidget {
  final ValueChanged<String>? onCategoryChanged;
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

  // List of main categories
  List<String> mainCategories = [
    'Maintenance', //
    'showRooms', //
    'insurance', //
    'rentalCars',
    'warranty', //
    'Evaluation', //
    'spareParts',
    'inspection', //
    'carCare',
    'mobileService',
    // Add more main categories as needed
  ];

  // Map of main categories to specialties
  Map<String, List<String>> specialties = {
    'Maintenance': [
      'Engines',
      'Electrical',
      'Mechanical',
      'Brake',
      'Ac',
      "Gear",
      'Glass',
      'Oil',
      'Tires',
      "programing",
      'Dyeing And Plumbing',
      ' Rediators or Exhaust'
    ],
    'showRooms': [],
    'insurance': [
      'Company',
      'Broker',
    ],
    'Evaluation': [],
    'rentalCars': [],
    'warranty': [],
    'spareParts': [
      'Steering',
      'Gera',
      'Engine',
      'Suspensio',
      'Fuel System',
      'Lighting Or Electrical',
      'Tires',
      'Colling Or Heating',
      'Air System',
      'Interior Parts',
      'Oil Or Filters',
      'Batteries',
      'Car Glass',
      'Exhaust',
      'Chassis Or Body',
    ],
    'inspection': [],
    'carCare': [
      'Glass Shading',
      'Car Polish',
      'Car Wash',
      'Accessories',
      'Car Wraps',
      'Keys or Remotes',
      'Interior Washing',
      'Car Upholstery',
      'Lights Polishing',
      'Engine Protection',
      'Car Body Protections',
      'Paint Protection',
    ],
    'mobileService': [
      'Tiers',
      'Battery',
      'Recovery',
      'Electric Charger',
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
              padding: EdgeInsets.only(left: 8.0.w),
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
                selectedSpecialtyIndices
                    .clear(); // Reset specialties on category change
                if (widget.onCategoryChanged != null) {
                  widget.onCategoryChanged!(value); // Pass the category name
                }
              });
            },
          ),
          const SizedBox(height: 16), // Add spacing between dropdowns
          if (selectedCategoryIndex != null)
            Wrap(
              spacing: 8,
              children: specialties[mainCategories[selectedCategoryIndex!]]!
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
