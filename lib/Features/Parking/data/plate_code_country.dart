import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mowaterApp/core/constants/color.dart';

List<PlateCodeAreModel> platesCodesCountry = [
  PlateCodeAreModel(
      nameCountry: 'Dubai', codes: getCodesByCountryName('dubai')),
  PlateCodeAreModel(
      nameCountry: ' Abu Dhabi', codes: getCodesByCountryName('Abu Dhabi')),
  PlateCodeAreModel(
      nameCountry: 'sharjah', codes: getCodesByCountryName('sharjah')),
  PlateCodeAreModel(
      nameCountry: 'ajman', codes: getCodesByCountryName('Ajman')),
  PlateCodeAreModel(nameCountry: 'rak', codes: getCodesByCountryName('rak')),
  PlateCodeAreModel(nameCountry: 'uaq', codes: getCodesByCountryName('uaq')),
  PlateCodeAreModel(
      nameCountry: 'Fujaira', codes: getCodesByCountryName('fujaira')),
];

class PlateCodeAreModel {
  String nameCountry;
  List<String> codes;
  PlateCodeAreModel({
    required this.nameCountry,
    required this.codes,
  });
}

List<String> getCodesByCountryName(String countryName) {
  switch (countryName.toLowerCase()) {
    case 'fujaira' || 'uaq' || 'rak' || 'ajman' || 'dubai':
      return [
        'A',
        'AA',
        'B',
        'BB',
        'C',
        'D',
        'E',
        'F',
        'G',
        'H',
        'I',
        'j',
        'K',
        'L',
        'M',
        'N',
        'O',
        'p',
        'Q',
        'S',
        'T',
        'U',
        'V',
        'W',
        'X',
        'Y',
        'Z',
        'WHITE'
      ];
    case 'abu dhabi':
      return [
        'A',
        '1',
        '2',
        '3',
        '4',
        '5',
        '6',
        '7',
        '8',
        '9',
        '10',
        '11',
        '12',
        '13',
        '14',
        '15',
        '16',
        '17',
        '18',
        '19',
        '20',
        '50',
      ];
    case 'sharjah':
      return [
        'White',
        'Orange',
        '1',
        '2',
        '3',
        '4',
      ];
    default:
      return [
        'A',
        '1',
        '2',
        '3',
        '4',
        '5',
        '6',
        '7',
        '8',
        '9',
        '10',
        '11',
        '12',
        '13',
        '14',
        '15',
        '16',
        '17',
        '18',
        '19',
        '20',
        '50',
      ];
  }
}

// class ParkingPlateCountry extends StatefulWidget {
//   final ValueChanged<String>? onCategoryChanged;
//   final ValueChanged<List<String>>? onSpecialtiesChanged;

//   const ParkingPlateCountry({
//     Key? key,
//     this.onCategoryChanged,
//     this.onSpecialtiesChanged,
//   }) : super(key: key);

//   @override
//   _ParkingPlateCountryState createState() => _ParkingPlateCountryState();
// }

// class _ParkingPlateCountryState extends State<ParkingPlateCountry> {
//   final _formKey = GlobalKey<FormState>();

//   // List of main categories

//   // Map of main categories to specialties

//   String? selectedCountry;
//   String selectedCode = '';

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           DropdownButtonFormField<String>(
//             isExpanded: true,
//             decoration: InputDecoration(
//               filled: true,
//               fillColor: ColorApp.secunderyColorDark,
//               contentPadding: const EdgeInsets.symmetric(vertical: 16),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//             hint: Padding(
//               padding: EdgeInsets.only(left: 8.0.w),
//               child: const Text(
//                 'plate code',
//                 style: TextStyle(fontSize: 14),
//               ),
//             ),
//             value: selectedCountry,
//             items: getCodesByCountryName(selectedCode)
//                 .map((item) => DropdownMenuItem<String>(
//                       value: item,
//                       child: Padding(
//                         padding: EdgeInsets.only(left: 8.0.w),
//                         child: Text(
//                           item,
//                           style: const TextStyle(
//                             fontSize: 14,
//                           ),
//                         ),
//                       ),
//                     ))
//                 .toList(),
//             onChanged: (value) {
//               setState(() {
//                 selectedCountry = value!;
//                 selectedCode = ''; // Reset specialties on category change
//                 if (widget.onCategoryChanged != null) {
//                   widget.onCategoryChanged!(value); // Pass the category name
//                 }
//               });
//             },
//           ),
//           const SizedBox(height: 16), // Add spacing between dropdowns
//           if (selectedCountry != null)
//             selectedCountry =
//         ],
//       ),
//     );
//   }
// }
