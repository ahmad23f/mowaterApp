import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Mowater/Features/UsedSpareParts/models/spare_part_company.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/helper/reqexp.dart';
import 'package:Mowater/core/style/text_style.dart';
import 'package:Mowater/core/widgets/button.dart';

class AvilableProductWidget extends StatelessWidget {
  SparePartProduct product;
  AvilableProductWidget({
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 180.w,
        margin: const EdgeInsets.symmetric(horizontal: mainPadding),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(product.image)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        product.productPrice,
                        style: TextStyles.text_14.copyWith(shadows: [
                          BoxShadow(
                              color: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .color!,
                              spreadRadius: 20,
                              blurRadius: 10)
                        ]),
                      ),
                      Text(
                        'AED '.tr(),
                        style: TextStyles.text_10.copyWith(
                            color: ColorApp.primeryColorDark,
                            shadows: [
                              BoxShadow(
                                  color: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .color!,
                                  spreadRadius: 20,
                                  blurRadius: 10)
                            ]),
                      ),
                    ],
                  ),
                  Text(
                    product.state == 1 ? 'USED'.tr() : 'NEW'.tr(),
                    style: product.state == 1
                        ? TextStyles.text_12.copyWith(
                            color: const Color.fromARGB(255, 255, 232, 29))
                        : TextStyles.text_12
                            .copyWith(color: ColorApp.primeryColorDark),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        textAlign: TextAlign.start,
                        AppRegex.extractEnglishText(
                          product.categoryName,
                        ),
                        style: TextStyles.text_12,
                      ),
                    ],
                  ),
                  CustomButton(
                      onPressed: () async {},
                      color: ColorApp.primeryColorDark,
                      padding: EdgeInsets.symmetric(horizontal: 50.w),
                      textStyle: TextStyles.text_12
                          .copyWith(color: Colors.white, fontSize: 12.sp),
                      text: "Order".tr())
                ],
              ),
            ),
          ],
        ));
  }
}
