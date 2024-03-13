import 'dart:math';

String generateToken() {
  // Get current timestamp
  int timestamp = DateTime.now().millisecondsSinceEpoch;

  // Generate a random number
  int random = Random().nextInt(1000000); // Adjust the range as needed

  // Combine timestamp and random number to create a unique token
  String token = '$timestamp$random';

  return token;
}
