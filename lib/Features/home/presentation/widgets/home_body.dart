import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:Mowater/Features/home/data/localData/local_category_name_screen.dart';
import 'package:Mowater/Features/home/presentation/categoryes.dart';
import 'package:Mowater/Features/home/presentation/cubits/trendCubit/trend_cubit.dart';
import 'package:Mowater/Features/home/presentation/widgets/trending/trending_list_view.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/style/text_style.dart';
import 'package:Mowater/core/widgets/loading_trending.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(mainPadding),
          BlocBuilder<TrendCubit, TrendState>(
            builder: (context, state) {
              return state.when(
                initial: () {
                  return const SizedBox();
                },
                success: (trendingModel) {
                  return TrendinglistView(trendings: trendingModel);
                },
                loading: () => const LoadingTrendinglistView(),
                failure: (error) => Center(
                  child: Text(
                    "There Unkown Error Well Fix It Soon!".tr(),
                    style: TextStyles.text_16,
                  ),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(mainPadding),
            child: Column(
              children: [
                const Divider(),
                verticalSpace(mainPadding),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: categorysList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: mainPadding,
                      crossAxisSpacing: mainPadding,
                      crossAxisCount: crorAxixCount(context),
                      childAspectRatio: 100.w / 120.h,
                    ),
                    itemBuilder: (context, index) => InkWell(
                      onTap: () => context.push(categorysNamesScreen[index]),
                      child: categorysList[index],
                    ),
                  ),
                ),
                verticalSpace(80.h),
              ],
            ),
          )
        ],
      ),
    );
  }
}
