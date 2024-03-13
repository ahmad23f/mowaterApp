import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationService {
  // Function to request and check location permissions
  Future<bool> checkLocationPermission() async {
    // Check if location permission is granted
    PermissionStatus permission = await Permission.location.request();
    return permission == PermissionStatus.granted;
  }

  // Function to get user's location
  Future<Position?> getUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled, ask user to enable them
      throw Exception('Location services are disabled.');
    }

    // Check location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // Location permissions are denied, request permission
      bool granted = await checkLocationPermission();
      if (!granted) {
        // Location permissions are still denied, return null
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Location permissions are permanently denied, return null
      return null;
    }

    // Location permissions are granted, get current location
    return await Geolocator.getCurrentPosition();
  }

  // Example usage
  Future<void> getLocation() async {
    try {
      bool hasPermission = await checkLocationPermission();
      if (!hasPermission) {
        print('Location permissions not granted.');
        return;
      }

      Position? position = await getUserLocation();
      if (position != null) {
        print(
            'Latitude: ${position.latitude}, Longitude: ${position.longitude}');
      } else {
        print('User denied location permissions.');
      }
    } catch (e) {
      print('Error getting location: $e');
    }
  }
}
