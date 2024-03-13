import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mowaterApp/Features/MaintenanceServices/categoryes/motors/presentation/widgets/company_loading_widget.dart';
import 'package:mowaterApp/core/constants/size.dart';
import 'package:mowaterApp/core/widgets/loading/shimmer_widget.dart';

class ContactLoadingRow extends StatelessWidget {
  const ContactLoadingRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ContactLoadingWidget(icon: FontAwesomeIcons.whatsapp),
        ContactLoadingWidget(icon: Icons.call_outlined),
      ],
    );
  }
}

class ContactLoadingWidget extends StatelessWidget {
  IconData icon;
  ContactLoadingWidget({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(5.dg),
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[800]!)),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          IconLoading(icon: icon),
          horizontalSpace(5.w),
          ShimmerWidget(width: 60.w, height: 20.w)
        ]),
      ),
    );
  }
}
