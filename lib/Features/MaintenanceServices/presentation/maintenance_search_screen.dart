import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:Mowater/Features/MaintenanceServices/categoryes/motors/presentation/motors_screen.dart';
import 'package:Mowater/Features/MaintenanceServices/categoryes/motors/presentation/widgets/company_loading_widget.dart';
import 'package:Mowater/Features/MaintenanceServices/presentation/mowaterSearch/maintenance_cubit.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/routing/routing_name.dart';
import 'package:Mowater/core/style/text_style.dart';

class MaintenanceSearchScreen extends StatelessWidget {
  final String query;

  const MaintenanceSearchScreen({Key? key, required this.query})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaintenanceSearchCubit, MaintenanceSearchState>(
      builder: (context, state) {
        return state.when(
          initial: () {
            return const SizedBox();
          },
          success: (data) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    context.push(RouteName.mowaterMartProductDetails,
                        extra: data[index]);
                  },
                  child: CompanyMaintenanceCompanyWidget(
                      companyModel: data[index])),
            );
          },
          faliure: (messages) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "There is no product with this name: ",
                      style: TextStyles.text_14.copyWith(fontSize: 12.sp),
                    ),
                    Text(
                      query,
                      style: TextStyles.text_14.copyWith(
                          fontSize: 14.sp, color: ColorApp.primeryColorDark),
                    ),
                  ],
                ),
              ],
            );
          },
          loading: () => const CompanyLoadingList(),
        );
      },
    );
  }
}
