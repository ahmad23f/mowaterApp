import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mowaterApp/Features/CareForSaleBrand/presentation/widgets/contact_whats_and_call.dart';
import 'package:mowaterApp/Features/rentalCars/models/company_rental_car.dart';
import 'package:mowaterApp/Features/rentalCars/presentation/widgets/avilable_car_widet.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/constants/size.dart';
import 'package:mowaterApp/core/routing/routing_name.dart';
import 'package:mowaterApp/core/style/text_style.dart';

class RentalCarCompanyDetailsScreen extends StatelessWidget {
  final CompanyRentalCarsModel company;
  List<String> days = [];

  RentalCarCompanyDetailsScreen({Key? key, required this.company})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    days = company.daysWeek.split(',');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          company.name ?? '',
          style: TextStyles.text_14.copyWith(fontSize: 14.sp),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 267.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  company.companyImage ?? '',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(mainPadding.dg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        company.name ?? '',
                        style: TextStyles.text_18.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: ColorApp.primeryColorDark,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            height: 30.h,
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.discount_outlined,
                                    size: 20.dg,
                                  ),
                                  Text(
                                    'mowaterApp Discount',
                                    style: TextStyles.text_12.copyWith(
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      Container(
                        width: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.white),
                        ),
                        child: Center(
                          child: Text(
                            '!',
                            style: TextStyles.text_12,
                          ),
                        ),
                      ),
                      horizontalSpace(mainPadding),
                      Text(
                        'Details',
                        style: TextStyles.text_14,
                      )
                    ],
                  ),
                  verticalSpace(mainPadding),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.warehouse_outlined,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                Text(
                                  "Number of cars available: ",
                                  style: TextStyles.text_12,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "${company.cars.length}",
                        style: TextStyles.text_12,
                      ),
                    ],
                  ),
                  verticalSpace(mainPadding),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Days:',
                        style: TextStyles.text_14,
                      ),
                      Text(
                        '${days.first} - ${days.last}',
                        style: TextStyles.text_12,
                      )
                    ],
                  ),
                  verticalSpace(mainPadding),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hours:',
                        style: TextStyles.text_14,
                      ),
                      Text(
                        '${company.startTime} - ${company.endTime}',
                        style: TextStyles.text_12,
                      )
                    ],
                  ),
                  verticalSpace(mainPadding),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Description :",
                        style: TextStyles.text_14,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 20.dg,
                            color: ColorApp.primeryColorDark,
                          ),
                          Text(
                            company.location,
                            style: TextStyles.text_16.copyWith(
                              color: ColorApp.primeryColorDark,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Text(
                    company.descreption,
                    style: TextStyles.text_14
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 20,
              endIndent: 20,
              indent: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Avilable Cars",
                style: TextStyles.text_18.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            verticalSpace(mainPadding),
            SizedBox(
              height: 200.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: company.cars.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      context.push(
                        RouteName.rentCarDetails,
                        extra: {
                          "car": company.cars[index],
                          "cars": company.cars,
                        },
                      );
                    },
                    child: SizedBox(
                        width: 200,
                        child: AvilableCarWidget(
                          car: company.cars[index],
                        )),
                  );
                },
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(mainPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Map View :',
                    style: TextStyles.text_18,
                  ),
                  verticalSpace(mainPadding),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      "https://i.stack.imgur.com/3XDdS.png",
                      height: 200.h,
                      width: mediasize(context).width,
                      fit: BoxFit.cover,
                    ),
                  ),
                  verticalSpace(mainPadding),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 100.h,
        child: ContactWhatsAndCall(
          callNumber: company.phoneNumber.toString(),
          whatsAppNumber: company.whatsApp.toString(),
        ),
      ),
    );
  }
}
