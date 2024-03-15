import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Mowater/Features/CareForSaleBrand/presentation/widgets/contact_whats_and_call.dart';
import 'package:Mowater/Features/mowaterMart/data/model/mowater_mart_product_model.dart';
import 'package:Mowater/Features/mowaterMart/presentation/widget/details_row.dart';
import 'package:Mowater/Features/mowaterMart/presentation/widget/mowater_mart_ads_product_widget.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/helper/reqexp.dart';
import 'package:Mowater/core/style/text_style.dart';

class ProductDetailsWidget extends StatelessWidget {
  MowaterMartProductModel martProductModel;
  ProductDetailsWidget({super.key, required this.martProductModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                    imageUrl: martProductModel.prodectImag ??
                        "https://cars.ksl.com/images/no-image-defaults/cars-noimage_sedan-lrg.png"),
              ),
              Positioned.fill(
                child: Center(
                  child: Opacity(
                    opacity: 0.3,
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: mediasize(context).height * 0.1.h,
                    ),
                  ),
                ),
              ),
              martProductModel.isAds == 1
                  ? const Positioned(top: 0, right: 0, child: PremiumWidget())
                  : const SizedBox.shrink()
            ],
          ),
          verticalSpace(mainPadding),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: mainPadding.dg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${martProductModel.prodectType}",
                      style: TextStyles.text_18.copyWith(
                          fontWeight: FontWeight.bold, fontSize: 18.sp),
                    ),
                    Row(
                      children: [
                        Text(
                          "${martProductModel.prodectPrice} ",
                          style: TextStyles.text_18.copyWith(
                            fontWeight: FontWeight.bold,
                            color: ColorApp.primeryColorDark,
                            fontSize: 18.sp,
                          ),
                        ),
                        Text(
                          "AED",
                          style: TextStyles.text_12.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp,
                              color: ColorApp.primeryColorDark),
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(),
                DetailsRow(
                    text: 'Car type:',
                    value:
                        AppRegex.extractEnglishText(martProductModel.carType!)),
                DetailsRow(
                    text: 'Car model:', value: martProductModel.carModel!),
                verticalSpace(5),
                DetailsRow(
                    text: 'State:',
                    value: martProductModel.carStatus! == 0 ? "new" : "used"),
                verticalSpace(mainPadding),
                DetailsRow(text: 'Year', value: martProductModel.prodectDate!),
                verticalSpace(mainPadding),
                SizedBox(
                  height: 80.h,
                  child: ContactWhatsAndCall(
                      callNumber: martProductModel.phoneNumber.toString(),
                      whatsAppNumber:
                          martProductModel.whatsAppNumber.toString()),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
