import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Mowater/Features/insurance/categorys/Brokers/persntation/cubit/insurance_provider_service_cubit.dart';
import 'package:Mowater/Features/insurance/categorys/Brokers/persntation/widget/provider_widget.dart';
import 'package:Mowater/Features/insurance/categorys/Brokers/persntation/widget/providre_loading_widget.dart';
import 'package:Mowater/Features/insurance/presentation/insurance_category_ads.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/style/text_style.dart';

class CompaniesScreen extends StatelessWidget {
  const CompaniesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Companies",
        style: TextStyles.text_20,
      )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const InsuranceCategoryAdsWidget(),
            Padding(
              padding: const EdgeInsets.all(mainPadding),
              child: Column(
                children: [
                  Divider(
                    indent: 20,
                    endIndent: 20,
                    height: 20.h,
                  ),
                  BlocBuilder<InsuranceProviderServiceCubit,
                      InsuranceProviderServiceState>(
                    builder: (context, state) {
                      return state.when(
                        initial: () => const SizedBox.shrink(),
                        success: (providers) {
                          return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: providers.length,
                              itemBuilder: (context, index) =>
                                  ServicesProviderWidget(
                                      provider: providers[index]));
                        },
                        faliure: () => Center(
                            child: Text(
                          "There are no service providers yet",
                          style: TextStyles.text_20,
                        )),
                        loading: () => const ProviderServiceLoadingListView(),
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
