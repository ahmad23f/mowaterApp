import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:Mowater/Features/Parking/data/image_principality.dart';
import 'package:Mowater/Features/Parking/data/plateService/plate_service.dart';
import 'package:Mowater/Features/Parking/models/plate_model.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/routing/routing_name.dart';
import 'package:Mowater/core/style/text_style.dart';
import 'package:Mowater/core/widgets/confirm_dialog.dart';

class PlateScreen extends StatefulWidget {
  const PlateScreen({super.key});

  @override
  State<PlateScreen> createState() => _PlateScreenState();
}

class _PlateScreenState extends State<PlateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            actions: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      context.push(RouteName.addPlate);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Add New Plate +",
                        style: TextStyles.text_16,
                      ),
                    ),
                  ),
                ],
              )
            ],
            title: Text(
              'My Plates',
              style: TextStyles.text_18,
            )),
        body: FutureBuilder(
          future: PlateService.getAllPlate(),
          builder: (context, snapshot) => snapshot.data!.isNotEmpty
              ? ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => Row(
                        children: [
                          MyPlateWidget(plate: snapshot.data![index]),
                          IconButton(
                              onPressed: () async {
                                ShowConfirmDialog.show(
                                  context,
                                  message:
                                      "Are You Sure Want To Delet The Plate",
                                  onConfirm: () async {
                                    await PlateService.deletePlate(index);
                                    Navigator.pop(context);

                                    setState(() {});
                                  },
                                );
                              },
                              icon: const Icon(Icons.delete_outline_rounded))
                        ],
                      ))
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'No Plate Add One Now!',
                        style: TextStyles.text_18,
                      ),
                    ),
                    CupertinoButton(
                        color: ColorApp.primeryColorDark,
                        onPressed: () {
                          context.push(RouteName.addPlate);
                        },
                        child: Text(
                          "Add Plate",
                          style: TextStyles.text_18.copyWith(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ))
                  ],
                ),
        ));
  }
}

class MyPlateWidget extends StatelessWidget {
  PlateModel plate;
  MyPlateWidget({super.key, required this.plate});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          textAlign: TextAlign.center,
          plate.nickName,
          style: TextStyles.text_18.copyWith(fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Container(
              width: 300.w,
              height: 90,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  color: const Color.fromARGB(255, 220, 220, 220),
                  border: Border.all(
                    color: ColorApp.categoryColorDark,
                    width: 3,
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    plate.plateCode,
                    style: TextStyles.text_20.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Image.asset(
                    height: 50.h,
                    width: 80.h,
                    itemImages[plate.plateSource]!,
                  ),
                  const SizedBox(),
                  Text(
                    plate.plateNumber,
                    style: TextStyles.text_20.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
