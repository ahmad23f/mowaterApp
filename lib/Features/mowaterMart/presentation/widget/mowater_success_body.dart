import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:Mowater/Features/mowaterMart/data/model/mowater_mart_product_model.dart';
import 'package:Mowater/Features/mowaterMart/presentation/widget/product_widget.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/routing/routing_name.dart';

class MowaterMartSuccessBody extends StatefulWidget {
  final List<MowaterMartProductModel> mowaterMartProducts;

  const MowaterMartSuccessBody({
    required this.mowaterMartProducts,
    Key? key,
  }) : super(key: key);

  @override
  State<MowaterMartSuccessBody> createState() => _MowaterMartSuccessBodyState();
}

class _MowaterMartSuccessBodyState extends State<MowaterMartSuccessBody> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(mainPadding.dg),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 6,
          mainAxisSpacing: mainPadding.h,
          childAspectRatio: 260 / 400,
          crossAxisCount: 2,
        ),
        itemCount: widget.mowaterMartProducts.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            context.push(
              RouteName.mowaterMartProductDetails,
              extra: widget.mowaterMartProducts[index],
            );
          },
          child: ProductWidget(data: widget.mowaterMartProducts[index]),
        ),
      ),
    );
  }
}
