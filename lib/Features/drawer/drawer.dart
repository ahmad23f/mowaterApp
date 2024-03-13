import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mowaterApp/Features/drawer/widgets/logout.dart';
import 'package:mowaterApp/Features/drawer/widgets/normalCompany/normal_company_profile_widget.dart';
import 'package:mowaterApp/Features/drawer/widgets/parking_number_car.dart';
import 'package:mowaterApp/Features/drawer/widgets/showRoomAndRentalCarsWidget/profile_widet.dart';
import 'package:mowaterApp/Features/drawer/widgets/user_profile.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/constants/size.dart';
import 'package:mowaterApp/core/routing/routing_name.dart';
import 'package:mowaterApp/core/services/company_model.dart';
import 'package:mowaterApp/core/services/company_service.dart';
import 'package:mowaterApp/core/services/user_state.dart';
import 'package:mowaterApp/core/services/user_type.dart';
import 'package:mowaterApp/core/style/text_style.dart';
import 'package:mowaterApp/core/widgets/button.dart';

class DrawerSlide extends StatefulWidget {
  const DrawerSlide({
    Key? key,
  }) : super(key: key);

  @override
  State<DrawerSlide> createState() => _DrawerSlideState();
}

class _DrawerSlideState extends State<DrawerSlide> {
  @override
  Widget build(BuildContext context) {
    // Determine which items to show based on user type
    Widget drawerItems = Container(); // Initialize drawerItems

    switch (NormalCompanyService.getCompanyData().companyType) {
      case 'MaintenanceCompanies':
        drawerItems = Column(
          children: [
            NormalCompanyProfile(),
            const ParkingNumberCar(),
            verticalSpace(mainPadding),
            const LogoutButton(),
          ],
        );
        break;
      default:
        drawerItems = Column(children: [
          UserProfileWidget(),
          const ParkingNumberCar(),
          verticalSpace(mainPadding),
          const LogoutButton()
        ]);
    }
    print(NormalCompanyService.getCompanyData().companyType);

    return SafeArea(
      child: Drawer(
        child: drawerItems,
      ),
    );
  }
}

class ImageViewDialog extends StatelessWidget {
  final Widget image;

  const ImageViewDialog({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child:
            ClipRRect(borderRadius: BorderRadius.circular(150), child: image),
      ),
    );
  }
}
