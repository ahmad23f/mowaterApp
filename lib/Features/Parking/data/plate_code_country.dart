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
    case 'dubai':
    case 'ajman':
    case 'rak':
    case 'uaq':
    case 'fujaira':
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
      return ['.'];
  }
}
