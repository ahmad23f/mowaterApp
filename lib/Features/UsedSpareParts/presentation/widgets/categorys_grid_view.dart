import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mowaterApp/Features/UsedSpareParts/data/categorys/categorys.dart';
import 'package:mowaterApp/core/constants/size.dart';
import 'package:mowaterApp/core/routing/routing_name.dart';

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
            print(index);
            context.push(RouteName.sparePartsScreen, extra: {
              'id': index,
              'categoryName': userSparePartsCategory[index].categoryName
            });
          },
          child: userSparePartsCategory[index]),
    );
  }
}
