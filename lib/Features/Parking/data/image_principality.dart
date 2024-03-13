String getPlateSourceImage(String shortName) {
  switch (shortName) {
    case "dubai":
      return imagePrincipality[0];
    case "abu Dhabi":
      return imagePrincipality[1];
    case "sharjah":
      return imagePrincipality[2];
    case "ajman":
      return imagePrincipality[3];
    case "fujairah":
      return imagePrincipality[4];
    case "rak":
      return imagePrincipality[5];
    default:
      return imagePrincipality[6];
  }
}

String principalityImageBaseUrl = 'assets/parking/';
List imagePrincipality = [
  '${principalityImageBaseUrl}Dubai.png',
  '${principalityImageBaseUrl}abu-dhabi-logo-.png',
  '${principalityImageBaseUrl}sharjah.png',
  '${principalityImageBaseUrl}Ajman_Logo.png',
  '${principalityImageBaseUrl}fujairah.png',
  '${principalityImageBaseUrl}rak.png',
  '${principalityImageBaseUrl}uaq.png',
];

final Map<String, String> itemImages = {
  'Dubai': imagePrincipality[0],
  'Abu Dhabi': imagePrincipality[1],
  'Sharjah': imagePrincipality[2],
  'Ajman': imagePrincipality[3],
  'Fujairah': imagePrincipality[4],
  'rak': imagePrincipality[5],
  'uaq': imagePrincipality[6],
};

String getPlateSourceCode(String name) {
  switch (name) {
    case "Dubai":
      return 'DXB';
    case "Abu Dhabi":
      return 'AUH';
    case "Sharjah":
      return "SHJ";
    case "Ajman":
      return "AJM";
    case "Fujairah":
      return "FUJ";
    case "rak":
      return 'RAK';
    default:
      return 'UAQ';
  }
}
