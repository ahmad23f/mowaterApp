import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mowaterApp/Features/CareForSaleBrand/presentation/widgets/car_widet.dart';
import 'package:mowaterApp/Features/CarsForSale/data/model/carModelProduct/car_model_product.dart';
import 'package:mowaterApp/Features/showRoomMyCars/presntation/myCars/show_room_my_cars_cubit.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/routing/routing_name.dart';
import 'package:mowaterApp/core/style/text_style.dart';
import 'package:mowaterApp/core/widgets/button.dart';

class ShowRoomMyCars extends StatelessWidget {
  const ShowRoomMyCars({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "My Cars",
          style: TextStyles.text_20,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0.dg),
            child: CustomButton(
                onPressed: () {
                  context.push(RouteName.showRoomAddEditCar,
                      extra: CarProduct(
                          showRoomId: 1,
                          extraInfo: '',
                          id: '',
                          carMake: '',
                          carModel: '',
                          year: 2020,
                          cylinders: 2,
                          condition: '',
                          location: '',
                          exteriorColor: '',
                          interiorColor: '',
                          gearBox: '',
                          fuelType: '',
                          warranty: 0,
                          doors: 2,
                          kilometer: '',
                          price: 0,
                          whatsappNumber: 0,
                          callNumber: 0,
                          userId: 0,
                          isAprove: 0,
                          isAds: 0,
                          createdAt: '',
                          imagesId: 0,
                          images: [],
                          specifications: ''));
                },
                color: ColorApp.primeryColorDark,
                textStyle: TextStyles.text_14.copyWith(color: Colors.white),
                text: 'Add New Car'),
          )
        ],
      ),
      body: BlocBuilder<ShowRoomMyCarsCubit, ShowRoomMyCarsState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox(),
            success: (myCars) {
              return Padding(
                padding: EdgeInsets.all(12.0.dg),
                child: ListView.builder(
                  itemCount: myCars.length,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0.h),
                    child: Stack(
                      children: [
                        CarWidget(car: myCars[index]),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(8.dg),
                            decoration: BoxDecoration(
                                color: ColorApp.primeryColorDark,
                                borderRadius: BorderRadius.circular(12)),
                            child: InkWell(
                                onTap: () {
                                  context.push(RouteName.showRoomAddEditCar,
                                      extra: myCars[index]);
                                },
                                child: const Icon(Icons.mode_edit_outlined)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
            failure: (errorMessage) => const Center(
              child: Text('You don\'t  add cars yet!'),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        },
      ),
    );
  }
}
