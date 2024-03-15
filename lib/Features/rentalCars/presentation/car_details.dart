import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Mowater/Features/CareForSaleBrand/presentation/cars_details_screen.dart';
import 'package:Mowater/Features/CareForSaleBrand/presentation/widgets/contact_whats_and_call.dart';
import 'package:Mowater/Features/rentalCars/models/rental_cars_model.dart';
import 'package:Mowater/Features/rentalCars/presentation/widgets/avilable_car_widet.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/networking/api_constant.dart';
import 'package:Mowater/core/style/text_style.dart';

class RentCarDetailsScreen extends StatefulWidget {
  final RentCarModel car;
  List<RentCarModel> cars;
  RentCarDetailsScreen({Key? key, required this.car, required this.cars})
      : super(key: key);

  @override
  _RentCarDetailsScreenState createState() => _RentCarDetailsScreenState();
}

class _RentCarDetailsScreenState extends State<RentCarDetailsScreen> {
  int selectedImage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "${widget.car.carMake} ${widget.car.year}",
            style: TextStyles.text_18.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FullScreenImageView(
                        imageUrls: widget.car.images
                            .map((image) =>
                                ApiConstans.imageCars + image.imageName)
                            .toList(), // Map all image URLs and convert to a list
                        initialIndex: selectedImage,
                      ),
                    ),
                  );
                },
                child: SizedBox(
                  height: 270.h,
                  child: Hero(
                    tag: 'imageHero',
                    child: Image.network(
                      ApiConstans.imageCars +
                          widget.car.images[selectedImage].imageName,
                      width: mediasize(context).width,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: mainPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.car.images.length,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedImage = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            height: 80,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                width: 2,
                                color: selectedImage == index
                                    ? ColorApp.primeryColorDark
                                    : Colors.transparent,
                              ),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(ApiConstans.imageCars +
                                    widget.car.images[index].imageName),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Item overview',
                      style: TextStyles.text_16.copyWith(
                          fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 90,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          CarItemOverviewWidget(
                            title: "carModel",
                            icon: const Icon(Icons.stars_outlined),
                            value: widget.car.carModel.toString(),
                          ),
                          CarItemOverviewWidget(
                            title: "YEAR",
                            icon: const Icon(Icons.date_range_outlined),
                            value: widget.car.year.toString(),
                          ),
                          CarItemOverviewWidget(
                            title: "REGIONAL SPECS",
                            icon: const Icon(Icons.map_outlined),
                            value: widget.car.regionalSpec,
                          ),
                          CarItemOverviewWidget(
                            title: "REGIONAL SPECS",
                            icon: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Image.asset(
                                'assets/images/carDoorIcon.png',
                                height: 20,
                              ),
                            ),
                            value: "${widget.car.doors.toString()} door",
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Additional Details',
                      style: TextStyles.text_16.copyWith(
                          fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                    DetailsRowWidget(
                        title: 'Daily price',
                        value: "${widget.car.dailyPrice} AED"),
                    DetailsRowWidget(
                        title: 'weekly price',
                        value: "${widget.car.weeklyPrice} AED"),
                    DetailsRowWidget(
                        title: 'Monthly price',
                        value: "${widget.car.monthlyPrice} AED"),
                    DetailsRowWidget(
                        title: 'Fuel Type', value: widget.car.fuelType),
                    const DetailsRowWidget(
                        title: 'Seller Type', value: 'seller'),
                    DetailsRowWidget(
                        title: 'Gear Type', value: widget.car.gearBox),
                    DetailsRowWidget(
                        title: 'Warranty',
                        value: widget.car.warranty == 0 ? "without" : "with"),
                    DetailsRowWidget(
                        title: 'No. Of Cylinders',
                        value: widget.car.cylinders.toString()),
                    DetailsRowWidget(
                        title: 'Exterior Color',
                        value: widget.car.exteriorColor),
                    DetailsRowWidget(
                        title: 'Interior Color',
                        value: widget.car.interiorColor),
                    DetailsRowWidget(
                        title: 'Extra Info', value: widget.car.extraInfo),
                  ],
                ),
              ),
              Text(
                'Avilable Cars',
                style: TextStyles.text_22.copyWith(),
              ),
              verticalSpace(mainPadding),
              SizedBox(
                height: 200.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.cars.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                        width: 200,
                        child: AvilableCarWidget(
                          car: widget.cars[index],
                        ));
                  },
                ),
              ),
              verticalSpace(mainPadding),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: ContactWhatsAndCall(
            callNumber: widget.car.callNumber.toString(),
            whatsAppNumber: widget.car.whatsappNumber.toString(),
          ),
        ),
      ),
    );
  }
}
