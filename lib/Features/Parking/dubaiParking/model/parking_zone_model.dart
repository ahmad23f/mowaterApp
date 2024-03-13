// ignore_for_file: public_member_api_docs, sort_constructors_first

class DubaiParkingAreaZoneModel {
  String firstChar;
  String startTime;
  String endTime;
  List<num> allowedHoures;
  int hourPrice;
  DubaiParkingAreaZoneModel(
      {required this.firstChar,
      required this.startTime,
      required this.endTime,
      required this.allowedHoures,
      required this.hourPrice});
}
