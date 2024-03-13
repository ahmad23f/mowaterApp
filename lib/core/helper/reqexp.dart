class AppRegex {
  static double extractNumber(String text) {
    // Define a regular expression to match digits
    RegExp regex = RegExp(r'\d+');

    // Find the first match in the input string
    Match? match = regex.firstMatch(text);

    // If a match is found, extract the number
    if (match != null) {
      String number = match.group(0)!;
      return double.parse(number);
    } else {
      // If no match found, return a default value or handle the case as needed
      return 0; // Or throw an exception, return null, etc.
    }
  }

  static String formatDistance(double distance) {
    if (distance < 1) {
      return "${(distance * 1000).toStringAsFixed(0)} meters";
    } else {
      return "${distance.toStringAsFixed(2)} km";
    }
  }

  static bool isEmailValid(String email) {
    return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(email);
  }

  static bool isPasswordValid(String password) {
    return RegExp(
            r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$")
        .hasMatch(password);
  }

  static bool isPhoneNumberValid(String phoneNumber) {
    return RegExp(r'^(010|011|012|015)[0-9]{8}$').hasMatch(phoneNumber);
  }

  static bool hasLowerCase(String password) {
    return RegExp(r'^(?=.*[a-z])').hasMatch(password);
  }

  static bool hasUpperCase(String password) {
    return RegExp(r'^(?=.*[A-Z])').hasMatch(password);
  }

  static bool hasNumber(String password) {
    return RegExp(r'^(?=.*?[0-9])').hasMatch(password);
  }

  static bool hasSpecialCharacter(String password) {
    return RegExp(r'^(?=.*?[#?!@$%^&*-])').hasMatch(password);
  }

  static bool hasMinLength(String password) {
    return RegExp(r'^(?=.{8,})').hasMatch(password);
  }

  static String extractEnglishText(String mixedText) {
    String englishText = '';
    bool foundNonEnglish = false;

    for (int i = 0; i < mixedText.length; i++) {
      String char = mixedText[i];

      if (!foundNonEnglish && isEnglishCharacter(char)) {
        englishText += char;
      } else {
        foundNonEnglish = true;
      }
    }

    return englishText.trim(); // Trim any leading/trailing whitespace
  }

  static bool isEnglishCharacter(String char) {
    // Check if the character is an English alphabet character (uppercase or lowercase)
    return (char.codeUnitAt(0) >= 65 &&
            char.codeUnitAt(0) <= 90) || // Uppercase letters
        (char.codeUnitAt(0) >= 97 &&
            char.codeUnitAt(0) <= 122); // Lowercase letters
  }
}
