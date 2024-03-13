import 'package:flutter/material.dart';
import 'package:mowaterApp/Features/mowaterMart/data/model/mowater_mart_product_model.dart';

class MowaterMartAdsWidget extends StatelessWidget {
  MowaterMartProductModel product;
  MowaterMartAdsWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(product.prodectPrice!),
    );
  }
}
