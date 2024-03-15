import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:Mowater/Features/Parking/data/image_principality.dart';
import 'package:Mowater/Features/Parking/data/plateService/plate_service.dart';
import 'package:Mowater/Features/Parking/models/plate_model.dart';
import 'package:Mowater/Features/Parking/presentation/parkingAds/parking_ads_cubit.dart';
import 'package:Mowater/Features/Parking/presentation/plate_screen.dart';
import 'package:Mowater/Features/Parking/presentation/widgets/send_sms_button.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/routing/routing_name.dart';
import 'package:Mowater/core/style/text_style.dart';

class KhorfakkanParkingScreen extends StatefulWidget {
  const KhorfakkanParkingScreen({super.key});

  @override
  State<KhorfakkanParkingScreen> createState() =>
      _KhorfakkanParkingScreenState();
}

class _KhorfakkanParkingScreenState extends State<KhorfakkanParkingScreen> {
  TextEditingController plateNumberController = TextEditingController();

  int numofHour = 1;

  var selectPlateIndex;

  var selectIndex;

  late PlateModel selectedPlate;

  @override
  Widget build(BuildContext context) {
    context.read<ParkingAdsCubit>().getParkingAdsIn(3);
    return Padding(
      padding: const EdgeInsets.all(mainPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // const ParkingAds(),
          // const Divider(),
          Text(
            'Number Of Hours',
            style: TextStyles.text_18,
          ),
          verticalSpace(mainPadding),
          SizedBox(
            height: 70.h,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: sharjahAlowedHours.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                child: GestureDetector(
                  onTap: () {
                    numofHour = sharjahAlowedHours[index];
                    setState(() {});
                  },
                  child: Center(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      decoration: BoxDecoration(
                        color: numofHour == sharjahAlowedHours[index]
                            ? ColorApp.primeryColorDark
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      height: 50.h,
                      width: 50.w,
                      child: Center(
                        child: Text(
                          sharjahAlowedHours[index].toString(),
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
                child: Row(
                  children: [
                    Text(
                      numofHour == 5 ? "12" : "${numofHour * 3 - 1}",
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
            future: PlateService.getByLastUserAllPlates(),
            builder: (context, snapshot) {
              if (snapshot.data!.isEmpty) {
                return InkWell(
                  onTap: () {
                    context.push(RouteName.addPlate);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 30.h),
                    width: 200.w,
                    height: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color.fromARGB(255, 211, 211, 211)),
                    child: const Icon(
                      Icons.add,
                      size: 50,
                    ),
                  ),
                );
              } else {
                selectedPlate = snapshot.data![selectPlateIndex ?? 0];
                selectIndex = selectIndex;
                return Column(
                  children: [
                    Text(
                      'My Cars',
                      style: TextStyles.text_22,
                    ),
                    CarouselSlider.builder(
                      itemCount: snapshot.data!.length + 1,
                      itemBuilder: (context, index, realIndex) => index <
                              snapshot.data!.length
                          ? Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 2.w),
                                  child: MyPlateWidget(
                                      plate: snapshot.data![index]),
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
                                    color: const Color.fromARGB(
                                        255, 211, 211, 211)),
                                child: const Icon(
                                  Icons.add,
                                  size: 50,
                                ),
                              ),
                            ),
                      options: CarouselOptions(
                        enableInfiniteScroll: false,
                        viewportFraction: 0.87,
                        aspectRatio: 70.w / 30.h,
                        onPageChanged: (index, reason) {
                          selectedPlate = snapshot.data![index];
                          selectIndex = index;
                        },
                      ),
                    ),
                    SendSmsButton(
                        smsBody:
                            '${getPlateSourceCode(selectedPlate.plateSource)}'
                            ' ${selectedPlate.plateNumber}'
                            ' KH'
                            ' $numofHour',
                        selectedPlate: selectedPlate,
                        toNumber: '5566')
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

List<int> sharjahAlowedHours = [1, 2, 3, 5];
