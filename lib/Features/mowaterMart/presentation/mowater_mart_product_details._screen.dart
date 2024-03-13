import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mowaterApp/Features/mowaterMart/data/model/mowater_mart_product_model.dart';
import 'package:mowaterApp/Features/mowaterMart/presentation/cubits/relatedProduct/related_product_cubit.dart';
import 'package:mowaterApp/Features/mowaterMart/presentation/widget/details_product_widget.dart';
import 'package:mowaterApp/Features/mowaterMart/presentation/widget/product_widget.dart';
import 'package:mowaterApp/Features/mowaterMart/presentation/widget/related_product_loading_list.dart';
import 'package:mowaterApp/core/constants/size.dart';
import 'package:mowaterApp/core/di/dependency_injection.dart';
import 'package:mowaterApp/core/style/text_style.dart';

class MowaterMartProductDetailsScreen extends StatelessWidget {
  MowaterMartProductModel martProductModel;
  MowaterMartProductDetailsScreen({super.key, required this.martProductModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          martProductModel.prodectType!,
          style: TextStyles.text_22.copyWith(fontSize: 22.sp),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(mainPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductDetailsWidget(martProductModel: martProductModel),
              Text(
                "Related Product:",
                style: TextStyles.text_20
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 20.sp),
              ),
              verticalSpace(10.h),
              BlocProvider(
                create: (context) => getIt<RelatedProductCubit>()
                  ..getRelated(martProductModel.id!, martProductModel.typesId!),
                child: BlocBuilder<RelatedProductCubit, RelatedProductState>(
                  builder: (context, state) {
                    return state.when(
                        initial: () => const SizedBox(),
                        loading: () => const RelatedProductLoadingList(),
                        failure: () => Text(
                              "There is no Related Product",
                              style:
                                  TextStyles.text_12.copyWith(fontSize: 12.sp),
                            ),
                        success: (data) => GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 10.h,
                              mainAxisSpacing: 10.w,
                              childAspectRatio: 260.h / 400.w,
                              crossAxisCount: 2,
                            ),
                            itemCount: data.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return ProductWidget(data: data[index]);
                            }));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
