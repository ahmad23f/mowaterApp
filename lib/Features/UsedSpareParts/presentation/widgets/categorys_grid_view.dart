import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:Mowater/Features/UsedSpareParts/data/categorys/categorys.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/routing/routing_name.dart';

class UsedSparePartsCategorysGridView extends StatelessWidget {
  const UsedSparePartsCategorysGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: userSparePartsCategory.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: mainPadding,
          crossAxisSpacing: mainPadding,
          crossAxisCount: crorAxixCount(context)),
      itemBuilder: (context, index) => InkWell(
          onTap: () {
            context.push(RouteName.sparePartsScreen, extra: {
              'id'.tr(): index,
              'categoryName'.tr(): userSparePartsCategory[index].categoryName
            });
          },
          child: userSparePartsCategory[index]),
    );
  }
}
