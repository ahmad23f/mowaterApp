import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mowaterApp/Features/Parking/data/image_principality.dart';
import 'package:mowaterApp/Features/Parking/data/plateService/plate_service.dart';
import 'package:mowaterApp/Features/Parking/dubaiParking/model/parking_zone_dubai.dart';
import 'package:mowaterApp/Features/Parking/dubaiParking/model/parking_zone_model.dart';
import 'package:mowaterApp/Features/Parking/models/plate_model.dart';
import 'package:mowaterApp/Features/Parking/presentation/parkingAds/parking_ads_cubit.dart';
import 'package:mowaterApp/Features/Parking/presentation/plate_screen.dart';
import 'package:mowaterApp/Features/Parking/presentation/widgets/send_sms_button.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/constants/size.dart';
import 'package:mowaterApp/core/routing/routing_name.dart';
import 'package:mowaterApp/core/style/text_style.dart';

class DubaiParkingScreen extends StatefulWidget {
  const DubaiParkingScreen({
    Key? key,
  }) : super(key: key);

  @override
  _DubaiParkingScreenState createState() => _DubaiParkingScreenState();
}

class _DubaiParkingScreenState extends State<DubaiParkingScreen> {
  TextEditingController plateNumberController = TextEditingController();

  PlateModel? selectedPlate;
  int selectIndex = 0;
  int selectPlateIndex = 0;
  DubaiParkingAreaZoneModel? selectedAreaZone;
  String startTime = '08:00 am';
  String endTime = '10:00 pm';
  num numofHour = 1;
  TextEditingController areaZoneNum = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    context.read<ParkingAdsCubit>().getParkingAdsIn(1);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // const ParkingAds(),
        Padding(
          padding: const EdgeInsets.all(mainPadding),
          child: Column(
            children: [
              const Divider(),
              Text(
                "Parking Zone",
                style: TextStyles.text_18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  Row(
                    children: [
                      Center(
                        child: SizedBox(
                          width: 70.w,
                          child: Form(
                            key: formKey,
                            child: TextFormField(
                              controller: areaZoneNum,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return '';
                                }
                                return null;
                              },
                              cursorColor: ColorApp.primeryColorDark,
                              decoration: const InputDecoration(
                                  hintText: '000',
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Colors.black,
                                  ))),
                              keyboardType: TextInputType.number,
                              style: TextStyles.text_32.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 35),
                              maxLength: 3,
                            ),
                          ),
                        ),
                      ),
                      horizontalSpace(10.w),
                      Text(
                        selectedAreaZone?.firstChar ?? "A",
                        style: TextStyles.text_32.copyWith(
                            fontSize: 40.sp, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        startTime,
                        style: TextStyles.text_12,
                      ),
                      Text(
                        endTime,
                        style: TextStyles.text_12,
                      ),
                    ],
                  )
                ],
              ),
              const Divider(),
              SizedBox(
                height: 100.h,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: dubaiParkingZone.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      selectedAreaZone = dubaiParkingZone[index];
                      startTime = dubaiParkingZone[index].startTime;
                      endTime = dubaiParkingZone[index].endTime;
                      selectIndex = index;
                      setState(() {});
                    },
                    child: Center(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        margin: EdgeInsets.symmetric(horizontal: 5.w),
                        decoration: BoxDecoration(
                          color: selectedAreaZone?.firstChar ==
                                  dubaiParkingZone[index].firstChar
                              ? ColorApp.primeryColorDark
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        height: 50.h,
                        width: 50.w,
                        child: Center(
                          child: Text(
                            dubaiParkingZone[index].firstChar,
                            style: TextStyles.text_20
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(
                thickness: 0.3,
              ),
              Text(
                'Number Of Hours',
                style: TextStyles.text_18,
              ),
              SizedBox(
                height: 70.h,
                child: ListView.builder(
                  itemCount:
                      dubaiParkingZone[selectIndex ?? 0].allowedHoures.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    child: GestureDetector(
                      onTap: () {
                        numofHour = dubaiParkingZone[selectIndex ?? 0]
                            .allowedHoures[index];
                        setState(() {});
                      },
                      child: Center(
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          margin: EdgeInsets.symmetric(horizontal: 5.w),
                          decoration: BoxDecoration(
                            color: numofHour ==
                                    dubaiParkingZone[selectIndex]
                                        .allowedHoures[index]
                                ? ColorApp.primeryColorDark
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          height: 50.h,
                          width: 50.w,
                          child: Center(
                            child: Text(
                              dubaiParkingZone[selectIndex]
                                  .allowedHoures[index]
                                  .toString(),
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
              const Divider()
            ],
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
              child: Row(
                children: [
                  Text(
                    "${selectedAreaZone?.hourPrice ?? 2}",
                    style: TextStyles.text_22,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "AED",
                      style: TextStyles.text_12
                          .copyWith(color: ColorApp.primeryColorDark),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),

        FutureBuilder(
          future: PlateService.getAllPlate(),
          builder: (context, snapshot) {
            if (snapshot.data!.isNotEmpty) {
              selectedPlate = snapshot.data?[selectPlateIndex];
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
            } else {
              return const Text("");
            }
          },
        ),

        selectedPlate != null
            ? SendSmsButton(
                smsBody:
                    '${getPlateSourceCode(selectedPlate!.plateSource) + selectedPlate!.plateCode}'
                    ' ${selectedPlate?.plateNumber ?? 0}'
                    ' ${areaZoneNum.text + (selectedAreaZone?.firstChar ?? "A")}'
                    ' ${numofHour == '1/2' ? "0.5" : numofHour}',
                selectedPlate: selectedPlate ??
                    PlateModel(
                        lastUse: DateTime.now(),
                        nickName: '',
                        plateNumber: '',
                        plateSource: '',
                        plateCode: ''),
                toNumber: '7275')
            : Text(
                'Select Area Zone To Can Send',
                style: TextStyles.text_12,
              ),
      ],
    );
  }
}
