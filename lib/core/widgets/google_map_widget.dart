import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidgetComapny extends StatelessWidget {
  String latitude;
  String longitude;
  int id;

  GoogleMapWidgetComapny(
      {super.key,
      required this.latitude,
      required this.longitude,
      required this.id});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
            height: 200.h,
            child: GoogleMap(
                markers: {
                  Marker(
                      markerId: MarkerId(id.toString()),
                      position: LatLng(
                          double.parse(latitude), double.parse(longitude)))
                },
                initialCameraPosition: CameraPosition(
                    zoom: 14,
                    target: LatLng(
                        double.parse(latitude), double.parse(longitude))))));
  }
}
