import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:Mowater/Features/serviceProverAuth/presnation/widgets/get_specialty_by_main_categoyr.dart';

class AddNewProductSparePartScreem extends StatelessWidget {
  const AddNewProductSparePartScreem({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneNumber = TextEditingController();
    TextEditingController whatssAppNumber = TextEditingController();
    return Scaffold(
      body: Column(
        children: [
          SpecialtyDropDownByMainCategory(
            mainCategory: 'spareParts'.tr(),
            onSpecialtiesChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
