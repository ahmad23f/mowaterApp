import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:Mowater/Features/mowaterMart/data/model/mowater_mart_product_model.dart';
import 'package:Mowater/Features/mowaterMart/presentation/widget/mowater_mart_ads_product_widget.dart';
import 'package:Mowater/Features/mowaterMart/presentation/widget/mowater_mart_body.dart';
import 'package:Mowater/core/routing/routing_name.dart';
import 'package:Mowater/core/style/text_style.dart';

class MowaterMartAdsBody extends StatelessWidget {
  List<MowaterMartProductModel> products;
  MowaterMartAdsBody({
    required this.products,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: products.isNotEmpty
            ? CarouselSlider.builder(
                itemCount: checkifAds(products).length,
                itemBuilder: (context, indexAds, realIndex) => InkWell(
                      onTap: () => context.push(
                          RouteName.mowaterMartProductDetails,
                          extra: checkifAds(products)[indexAds]),
                      child: MowaterMartAdsProductWidget(
                          product: checkifAds(products)[indexAds]),
                    ),
                options: CarouselOptions(
                  aspectRatio: 16 / 9,
                  autoPlay: true,
                  viewportFraction: 1,
                  disableCenter: true,
                ))
            : SizedBox(
                height: 200.h,
                child: Center(
                    child: Text(
                  'There Is No Ads Yet!',
                  style: TextStyles.text_16
                      .copyWith(fontSize: 16.sp, fontWeight: FontWeight.bold),
                )),
              ));
  }
}
