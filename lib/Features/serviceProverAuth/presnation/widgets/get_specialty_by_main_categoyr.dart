import 'package:flutter/material.dart';

class SpecialtyDropDownByMainCategory extends StatefulWidget {
  final String mainCategory;
  final ValueChanged<List<int>> onSpecialtiesChanged;
  final List<String>? initialSelectedSpecialties; // Changed to List<String>?

  const SpecialtyDropDownByMainCategory({
    Key? key,
    required this.mainCategory,
    required this.onSpecialtiesChanged,
    this.initialSelectedSpecialties,
  }) : super(key: key);

  @override
  _SpecialtyDropDownByMainCategoryState createState() =>
      _SpecialtyDropDownByMainCategoryState();
}

class _SpecialtyDropDownByMainCategoryState
    extends State<SpecialtyDropDownByMainCategory> {
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
      'Evaluation',
      "programing",
      'Dyeing And Plumbing',
      'Rediators or Exhaust'
    ],
    'showRooms': [],
    'insurance': [
      'Broker',
      'Company',
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

  late List<String> _specialties;
  late List<int> _selectedSpecialtyIndices;

  @override
  void initState() {
    super.initState();
    _specialties = getSpecialtiesForCategory(widget.mainCategory);
    _selectedSpecialtyIndices = widget.initialSelectedSpecialties != null
        ? getSelectedSpecialtyIndices(widget.initialSelectedSpecialties!)
        : [];
  }

  List<String> getSpecialtiesForCategory(String category) {
    return specialties[category] ?? [];
  }

  List<int> getSelectedSpecialtyIndices(List<String> initialSpecialties) {
    List<int> selectedIndices = [];
    for (String specialty in initialSpecialties) {
      int index = _specialties.indexOf(specialty);
      if (index != -1) {
        selectedIndices.add(index);
      }
    }
    return selectedIndices;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Specialties for ${widget.mainCategory}:',
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
