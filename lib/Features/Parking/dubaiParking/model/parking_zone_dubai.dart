import 'package:Mowater/Features/Parking/dubaiParking/model/parking_zone_model.dart';

List<DubaiParkingAreaZoneModel> dubaiParkingZone = [
  DubaiParkingAreaZoneModel(
    firstChar: 'A',
    startTime: "08:00 am",
    endTime: "10:00 pm",
    allowedHoures: [1 / 2, 1, 2, 3, 4], // Removed double quotes from values
    hourPrice: 4,
  ),
  DubaiParkingAreaZoneModel(
    firstChar: 'B',
    startTime: "08:00 am",
    endTime: "10:00 pm",
    allowedHoures: [1, 2, 3, 4, 5, 24], // Removed double quotes from values
    hourPrice: 3,
  ),
  DubaiParkingAreaZoneModel(
    hourPrice: 2,
    firstChar: 'C',
    startTime: "08:00 am",
    endTime: "10:00 pm",
    allowedHoures: [1, 2, 3, 4], // Removed double quotes from values
  ),
  DubaiParkingAreaZoneModel(
    hourPrice: 2,
    firstChar: 'D',
    startTime: "08:00 am",
    endTime: "10:00 pm",
    allowedHoures: [1, 2, 3, 4, 24], // Removed double quotes from values
  ),
  DubaiParkingAreaZoneModel(
    hourPrice: 4,
    firstChar: 'E',
    startTime: "08:00 am",
    endTime: "11:00 pm",
    allowedHoures: [1, 2, 3, 4], // Removed double quotes from values
  ),
  DubaiParkingAreaZoneModel(
    hourPrice: 2,
    firstChar: 'F',
    startTime: "08:00 am",
    endTime: "06:00 pm",
    allowedHoures: [1, 2, 3, 4], // Removed double quotes from values
  ),
  DubaiParkingAreaZoneModel(
    hourPrice: 4,
    firstChar: 'G',
    startTime: "08:00 am",
    endTime: "10:00 pm",
    allowedHoures: [1, 2, 3, 4], // Removed double quotes from values
  ),
  DubaiParkingAreaZoneModel(
    hourPrice: 4,
    firstChar: 'H',
    startTime: "08:00 am",
    endTime: "10:00 pm",
    allowedHoures: [
      1 / 2,
      1,
      2,
      3,
      4,
      5,
      6
    ], // Removed double quotes from values
  ),
  DubaiParkingAreaZoneModel(
    hourPrice: 10,
    firstChar: 'I',
    startTime: "08:00 am",
    endTime: "10:00 pm",
    allowedHoures: [1, 2, 3], // Removed double quotes from values
  ),
  DubaiParkingAreaZoneModel(
    hourPrice: 4,
    firstChar: 'J',
    startTime: "08:00 am",
    endTime: "10:00 pm",
    allowedHoures: [1 / 2, 1, 2, 3], // Removed double quotes from values
  ),
  DubaiParkingAreaZoneModel(
    hourPrice: 4,
    firstChar: 'K',
    startTime: "08:00 am",
    endTime: "10:00 pm",
    allowedHoures: [1 / 2, 1, 2, 3, 4], // Removed double quotes from values
  ),
];
