import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:Mowater/Features/CareForSaleBrand/presentation/widgets/contact_whats_and_call.dart';
import 'package:Mowater/Features/inspection/models/inspection_company_model.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/routing/routing_name.dart';
import 'package:Mowater/core/style/text_style.dart';

class InspectionCompanyWidget extends StatelessWidget {
  final InspectionCompanyModel companyModel;

  const InspectionCompanyWidget({Key? key, required this.companyModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(RouteName.inspectionCompanyDetails, extra: companyModel);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        height: 298,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: companyModel.companyImage ?? '',
                fit: BoxFit.cover,
                width: mediasize(context).width,
                height: 160,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        companyModel.name ?? '',
                        style: const TextStyle(fontSize: 14),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_sharp,
                            size: 20,
                            color: ColorApp.primeryColorDark,
                          ),
                          Text(
                            companyModel.location ?? '',
                            style: TextStyle(
                              fontSize: 14,
                              color: ColorApp.primeryColorDark,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.construction_sharp),
                      const SizedBox(width: 5),
                      Text(
                        '${companyModel.brandNames.length}+ Car Make',
                        style: TextStyles.text_14
                            .copyWith(fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.access_time_rounded),
                      const SizedBox(width: 5),
                      Text(
                        companyModel.startTime ?? '',
                        style: const TextStyle(fontSize: 14),
                      ),
                      Text(
                        " - ${companyModel.endTime}",
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ContactWhatsAndCall(
                callNumber: companyModel.phoneNumber ?? '',
                whatsAppNumber: companyModel.whatsAppNumber ?? '',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
