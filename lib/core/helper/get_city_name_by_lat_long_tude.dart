import 'package:geocoding/geocoding.dart';

Future<String?> getCityName(double latitude, double longitude) async {
  try {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    if (placemarks.isNotEmpty) {
      return placemarks.first.locality;
    }
  } catch (e) {
    print('Error getting city name: $e');
  }
  return null;
}
