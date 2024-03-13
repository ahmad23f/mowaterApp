import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mowaterApp/Features/Parking/aboDhabiParking/presentation/widgets/parking_type_line.dart';
import 'package:mowaterApp/Features/Parking/aboDhabiParking/presentation/widgets/parking_zone_type.dart';
import 'package:mowaterApp/Features/Parking/data/image_principality.dart';
import 'package:mowaterApp/Features/Parking/data/plateService/plate_service.dart';
import 'package:mowaterApp/Features/Parking/models/plate_model.dart';
import 'package:mowaterApp/Features/Parking/presentation/plate_screen.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/constants/size.dart';
import 'package:mowaterApp/core/routing/routing_name.dart';
import 'package:mowaterApp/core/style/text_style.dart';
import 'package:mowaterApp/core/widgets/button.dart';
import 'package:mowaterApp/core/widgets/snak_bar.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AboDhabiScreen extends StatefulWidget {
  const AboDhabiScreen({super.key});

  @override
  State<AboDhabiScreen> createState() => _AboDhabiScreenState();
}

class _AboDhabiScreenState extends State<AboDhabiScreen> {
  TextEditingController plateNumberController = TextEditingController();

  String plateCode = '';

  String plateSource = '';

  String timeParking = '';

  String selectedParkingZone = 'Stander';
  int numofHour = 1;

  PlateModel? selectedPlate;

  var selectPlateIndex;

  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const ParkingAds(),
        Padding(
          padding: const EdgeInsets.all(mainPadding),
          child: Column(
            children: [
              Text(
                "Parking Zone",
                style: TextStyles.text_22,
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 250.w,
                height: 60.h,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorApp.primeryColorDark,
                    ),
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AbuDhabiParkingType(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                        ),
                        onTap: () {
                          selectedParkingZone = 'Premium';
                          setState(() {});
                        },
                        typeName: "Premium",
                        selectedType: selectedParkingZone),
                    AbuDhabiParkingType(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                        onTap: () {
                          selectedParkingZone = 'Stander';
                          setState(() {});
                        },
                        typeName: "Stander",
                        selectedType: selectedParkingZone),
                  ],
                ),
              ),
            ],
          ),
        ),
        verticalSpace(20.h),

        ParkingTypeLine(selectedParkingZone: selectedParkingZone),
        verticalSpace(20.h),
        Divider(
          height: 20.h,
        ),
        selectedParkingZone == "Stander"
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.arrow_back_ios_sharp),
                    Text(
                      "Number Of Hours",
                      style: TextStyles.text_20,
                    ),
                    const Icon(Icons.arrow_forward_ios),
                  ],
                ))
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Number Of Hours",
                  style: TextStyles.text_20,
                ),
              ),
        SizedBox(
          height: 70.h,
          child: ListView.builder(
            itemCount: AbuDhabiGetParkingTypeHours(selectedParkingZone).length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              child: GestureDetector(
                onTap: () {
                  numofHour =
                      AbuDhabiGetParkingTypeHours(selectedParkingZone)[index];
                  setState(() {});
                },
                child: Center(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    margin: EdgeInsets.symmetric(horizontal: 5.w),
                    decoration: BoxDecoration(
                      color: numofHour ==
                              AbuDhabiGetParkingTypeHours(
                                  selectedParkingZone)[index]
                          ? ColorApp.primeryColorDark
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    height: 50.h,
                    width: 50.w,
                    child: Center(
                      child: Text(
                        "${AbuDhabiGetParkingTypeHours(selectedParkingZone)[index]}",
                        style: TextStyles.text_20
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Card(
          child: ListTile(
            title: Text(
              "Parking Fare For This Zone And The Number Of Hours Selected Is:",
              style: TextStyles.text_12,
            ),
            trailing: SizedBox(
                width: 70.w,
                child: selectedParkingZone == 'Stander'
                    ? Row(
                        children: [
                          numofHour == 24
                              ? Row(
                                  children: [
                                    Text(
                                      "15",
                                      style: TextStyles.text_22,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "AED",
                                        style: TextStyles.text_12.copyWith(
                                            color: ColorApp.primeryColorDark),
                                      ),
                                    )
                                  ],
                                )
                              : Row(
                                  children: [
                                    Text(
                                      "${numofHour * 2}",
                                      style: TextStyles.text_22,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "AED",
                                        style: TextStyles.text_12.copyWith(
                                            color: ColorApp.primeryColorDark),
                                      ),
                                    )
                                  ],
                                )
                        ],
                      )
                    : Row(
                        children: [
                          numofHour == 24
                              ? Row(
                                  children: [
                                    Text(
                                      "15",
                                      style: TextStyles.text_22,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "AED",
                                        style: TextStyles.text_12.copyWith(
                                            color: ColorApp.primeryColorDark),
                                      ),
                                    )
                                  ],
                                )
                              : Row(
                                  children: [
                                    Text(
                                      "${(numofHour * 3)}",
                                      style: TextStyles.text_22,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "AED",
                                        style: TextStyles.text_12.copyWith(
                                          color: ColorApp.primeryColorDark,
                                        ),
                                      ),
                                    )
                                  ],
                                )
                        ],
                      )),
          ),
        ),

        FutureBuilder(
          future: PlateService.getAllPlate(),
          builder: (context, snapshot) {
            if (snapshot.data!.isEmpty) {
              return const Text("");
            } else {
              selectedPlate = snapshot.data?[selectPlateIndex ?? 0];
              selectIndex = selectIndex;
              return Column(
                children: [
                  Text(
                    'My Cars',
                    style: TextStyles.text_22,
                  ),
                  verticalSpace(20.h),
                  CarouselSlider.builder(
                    itemCount: snapshot.data!.length + 1,
                    itemBuilder: (context, index, realIndex) => index <
                            snapshot.data!.length
                        ? Column(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 2.w),
                                child:
                                    MyPlateWidget(plate: snapshot.data![index]),
                              ),
                            ],
                          )
                        : InkWell(
                            onTap: () {
                              context.push(RouteName.addPlate);
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 30.h),
                              width: 200.w,
                              height: 90,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color:
                                      const Color.fromARGB(255, 211, 211, 211)),
                              child: const Icon(
                                Icons.add,
                                size: 50,
                              ),
                            ),
                          ),
                    options: CarouselOptions(
                      enableInfiniteScroll: false,
                      viewportFraction: 0.84,
                      aspectRatio: 70.w / 28.h,
                      onPageChanged: (index, reason) {
                        selectedPlate = snapshot.data![index];
                        selectIndex = index;
                      },
                    ),
                  ),
                ],
              );
            }
          },
        ),
        CustomButton(
          padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 10),
          onPressed: () async {
            // Construct the SMS body with parking details
            String smsBody =
                '${getPlateSourceCode(selectedPlate!.plateSource) + selectedPlate!.plateCode}'
                ' ${selectedPlate!.plateNumber}'
                ' ${selectedParkingZone == 'Stander' ? 'S' : "P"}'
                ' $numofHour';

            // Encode the message body for URL
            String encodedBody = Uri.encodeComponent(smsBody);

            // Construct the SMS URI
            String uri = 'sms:3009?body=$encodedBody';

            try {
              // Launch the SMS app with the pre-filled message
              await launchUrlString(uri);
            } catch (e) {
              ShowSnakBar(
                context,
                title: 'Failure',
                iconData: Icons.info_outline_rounded,
                messageTextStyle:
                    TextStyles.text_16.copyWith(fontWeight: FontWeight.bold),
                content: 'There Was Unkown Error Well Fix It Soon!',
                subtitleTextStyle: TextStyles.text_16,
                backGroundColor: ColorApp.secunderyColorDark,
              );
            }
          },
          color: ColorApp.primeryColorDark,
          textStyle: TextStyles.text_24
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          text: 'Send',
        ),
      ],
    );
  }
}

List<int> AbuDhabiGetParkingTypeHours(String type) {
  if (type == 'Stander') {
    return [1, 2, 3, 4, 5, 6, 7, 24];
  } else {
    return [1, 2, 3, 4];
  }
}
