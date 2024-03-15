import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Mowater/Features/CareForSaleBrand/presentation/widgets/car_image.dart';
import 'package:Mowater/Features/CareForSaleBrand/presentation/widgets/car_price_and_premium.dart';
import 'package:Mowater/Features/CareForSaleBrand/presentation/widgets/care_date_and_kilometers.dart';
import 'package:Mowater/Features/CareForSaleBrand/presentation/widgets/care_model_and_name.dart';
import 'package:Mowater/Features/CareForSaleBrand/presentation/widgets/contact_whats_and_call.dart';
import 'package:Mowater/Features/CarsForSale/data/model/carModelProduct/car_model_product.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/constants/size.dart';

class CarWidget extends StatefulWidget {
  CarProduct car;

  CarWidget({
    required this.car,
    super.key,
  });

  @override
  State<CarWidget> createState() => _CarWidgetState();
}

class _CarWidgetState extends State<CarWidget> {
  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          SizedBox(
              height: mediasize(context).height * 0.26,
              width: mediasize(context).width,
              child: CarImageWidget(images: widget.car.images)),
          verticalSpace(5.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
            child: Column(
              children: [
                CarPriceWithPremium(carModel: widget.car),
                CarModelAndName(
                    carModel: widget.car.carModel.toString(),
                    carName: widget.car.carMake.toString()),
                CarPrimeryDetails(
                  carModel: widget.car,
                ),
                verticalSpace(6.h),
              ],
            ),
          ),
          Divider(
            height: 5.h,
            thickness: 0.5.dg,
          ),
          verticalSpace(mainPadding),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
            child: ContactWhatsAndCall(
                callNumber: widget.car.callNumber.toString() ?? '',
                whatsAppNumber: widget.car.whatsappNumber.toString() ?? ''),
          ),
          verticalSpace(5.h)
        ],
      ),
    );
  }
}
