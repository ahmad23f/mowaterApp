import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SpecialtyDropDownByMainCategory extends StatefulWidget {
  final String mainCategory;
  final ValueChanged<List<int>> onSpecialtiesChanged;

  const SpecialtyDropDownByMainCategory({
    Key? key,
    required this.mainCategory,
    required this.onSpecialtiesChanged,
  }) : super(key: key);

  @override
  _SpecialtyDropDownByMainCategoryState createState() =>
      _SpecialtyDropDownByMainCategoryState();
}

class _SpecialtyDropDownByMainCategoryState
    extends State<SpecialtyDropDownByMainCategory> {
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
      'Evaluation'.tr(),
      "programing".tr(),
      'Dyeing And Plumbing'.tr(),
      'Rediators or Exhaust'.tr()
    ],
    'showRooms'.tr(): [],
    'insurance'.tr(): [
      'Broker'.tr(),
      'Company'.tr(),
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

  late List<String> _specialties;
  final List<int> _selectedSpecialtyIndices = [];

  @override
  void initState() {
    super.initState();
    _specialties = getSpecialtiesForCategory(widget.mainCategory);
  }

  List<String> getSpecialtiesForCategory(String category) {
    return specialties[category] ?? [];
  }

  List<int> getSelectedSpecialtyIndices() {
    return _selectedSpecialtyIndices;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Specialties for ${widget.mainCategory}:'.tr(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8.0,
          children: _specialties.asMap().entries.map((entry) {
            final index = entry.key;
            final specialty = entry.value;
            return ChoiceChip(
              label: Text(specialty),
              selected: _selectedSpecialtyIndices.contains(index),
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    _selectedSpecialtyIndices.add(index);
                  } else {
                    _selectedSpecialtyIndices.remove(index);
                  }
                  widget.onSpecialtiesChanged(_selectedSpecialtyIndices);
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
