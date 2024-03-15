import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:Mowater/Features/mowaterMart/data/model/mowater_mart_product_model.dart';
import 'package:Mowater/Features/mowaterMart/presentation/widget/mowater_mart_ads_product_widget.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/helper/reqexp.dart';
import 'package:Mowater/core/routing/routing_name.dart';
import 'package:Mowater/core/style/text_style.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  final MowaterMartProductModel data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(RouteName.mowaterMartProductDetails, extra: data);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).colorScheme.secondary,
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(98, 0, 0, 0),
              spreadRadius: 0.0,
              blurRadius: 10,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: mediasize(context).height * 0.2.h,
                  width: mediasize(context).width.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: data.prodectImag ??
                          "https://cars.ksl.com/images/no-image-defaults/cars-noimage_sedan-lrg.png",
                    ),
                  ),
                ),
                data.isAds == 1
                    ? const Positioned(
                        top: 0,
                        right: 0,
                        child: PremiumWidget(),
                      )
                    : const SizedBox.shrink()
              ],
            ),
            Padding(
              padding: EdgeInsets.all(8.0.dg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.prodectType!,
                    style: TextStyles.text_12.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                    ),
                  ),
                  verticalSpace(5.h),
                  Row(
                    children: [
                      Text(
                        AppRegex.extractEnglishText(
                          data.carType!,
                        ),
                        style: TextStyles.text_12.copyWith(
                          fontSize: 12.sp,
                        ),
                      ),
                      Text(
                        ' -  ',
                        style: TextStyles.text_12,
                      ),
                      Text(
                        data.carModel.toString(),
                        style: TextStyles.text_12.copyWith(
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(5.h),
                  Divider(
                    height: 3.h,
                    thickness: 2,
                    indent: 20,
                    endIndent: 20,
                  ),
                  verticalSpace(5.h),
                  Row(
                    children: [
                      Text(
                        "${data.prodectPrice!} ",
                        style: TextStyles.text_18.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "AED",
                        style: TextStyles.text_12.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorApp.primeryColorDark,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
