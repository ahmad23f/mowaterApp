import 'package:Mowater/Features/mowaterMart/data/model/mowater_mart_product_model.dart';
import 'package:flutter/material.dart';

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
