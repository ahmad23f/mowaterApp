import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mowaterApp/Features/Parking/data/image_principality.dart';
import 'package:mowaterApp/Features/Parking/data/plateService/plate_service.dart';
import 'package:mowaterApp/Features/Parking/models/plate_model.dart';
import 'package:mowaterApp/Features/Parking/presentation/parkingAds/parking_ads_cubit.dart';
import 'package:mowaterApp/Features/Parking/presentation/plate_screen.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/constants/size.dart';
import 'package:mowaterApp/core/routing/routing_name.dart';
import 'package:mowaterApp/core/style/text_style.dart';
import 'package:mowaterApp/core/widgets/button.dart';
import 'package:mowaterApp/core/widgets/snak_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class AjmanParkingScreen extends StatefulWidget {
  const AjmanParkingScreen({super.key});

  @override
  State<AjmanParkingScreen> createState() => _AjmanParkingScreenState();
}

class _AjmanParkingScreenState extends State<AjmanParkingScreen> {
  TextEditingController plateNumberController = TextEditingController();

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
          Center(
            child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                decoration: BoxDecoration(
                  color: ColorApp.primeryColorDark,
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 50.h,
                width: 50.w,
                child: Center(
                  child: Text(
                    '1',
                    style: TextStyles.text_22
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                )),
          ),
          verticalSpace(mainPadding),
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
                      "2",
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
                  ],
                );
              }
            },
          ),
          CustomButton(
            padding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 10),
            onPressed: () async {
              // Construct the SMS body with parking details
              String smsBody =
                  '${getPlateSourceCode(selectedPlate.plateSource)}'
                  ' ${selectedPlate.plateCode}'
                  ' ${selectedPlate.plateNumber}';

              // Encode the message body for URL
              String encodedBody = Uri.encodeComponent(smsBody);

              // Construct the SMS URI
              String uri = 'sms:5566?body=$encodedBody';

              try {
                print(selectIndex);
                // Launch the SMS app with the pre-filled message
                await launchUrl(Uri.parse(uri),
                    mode: LaunchMode.platformDefault);
                await PlateService.findPlateIndexByCode(PlateModel(
                    lastUse: DateTime.now(),
                    nickName: selectedPlate.nickName,
                    plateNumber: selectedPlate.plateNumber,
                    plateSource: selectedPlate.plateSource,
                    plateCode: selectedPlate.plateCode));
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
      ),
    );
  }
}
