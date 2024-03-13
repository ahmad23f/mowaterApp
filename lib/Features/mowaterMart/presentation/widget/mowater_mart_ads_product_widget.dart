import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mowaterApp/Features/mowaterMart/data/model/mowater_mart_product_model.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/constants/size.dart';
import 'package:mowaterApp/core/style/text_style.dart';

class MowaterMartAdsProductWidget extends StatelessWidget {
  const MowaterMartAdsProductWidget({
    super.key,
    required this.product,
  });

  final MowaterMartProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: mediasize(context).width,
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                    height: 216.h,
                    fit: BoxFit.fitWidth,
                    imageUrl: product.prodectImag!),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0.h,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.7),
                            Colors.transparent
                          ]),
                      borderRadius: BorderRadius.circular(12)),
                  width: mediasize(context).width,
                  height: 130.h,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              product.prodectType!,
                              style: TextStyles.text_18.copyWith(
                                  fontSize: 18.sp,
                                  shadows: [
                                    const Shadow(
                                        color: Colors.black, blurRadius: 20)
                                  ]),
                            ),
                            Text(
                              product.carType!,
                              style: TextStyles.text_18.copyWith(
                                  fontSize: 18.sp,
                                  shadows: [
                                    const Shadow(
                                        color: Colors.black, blurRadius: 20)
                                  ]),
                            ),
                          ],
                        ),
                        Text(
                          "${product.prodectPrice!} AED",
                          style: TextStyles.text_14
                              .copyWith(fontSize: 14.sp, shadows: [
                            const Shadow(color: Colors.black, blurRadius: 20)
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(top: 0, right: 5.w, child: const PremiumWidget())
          ],
        ),
      ],
    );
  }
}

class PremiumWidget extends StatelessWidget {
  const PremiumWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.dg),
      decoration: BoxDecoration(
          color: ColorApp.primeryColorDark,
          borderRadius: BorderRadius.circular(6)),
      child: Row(
        children: [
          Icon(
            Icons.local_fire_department_outlined,
            color: Colors.white,
            size: 15.dg,
          ),
          Text("PERMIUM",
              style: TextStyles.text_10.copyWith(
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}
