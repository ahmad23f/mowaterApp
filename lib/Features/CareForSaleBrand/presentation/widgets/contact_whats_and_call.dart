import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Mowater/Features/CareForSaleBrand/presentation/widgets/contact_widgtet.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/helper/url_lancher.dart';

class ContactWhatsAndCall extends StatelessWidget {
  String callNumber;
  String whatsAppNumber;
  ContactWhatsAndCall(
      {super.key, required this.callNumber, required this.whatsAppNumber});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ContactIconWithName(
          onTap: () async => await openWhatsAppChat(whatsAppNumber),
          icon: FontAwesomeIcons.whatsapp,
          name: 'WhatsApp',
          color: Colors.green,
        ),
        horizontalSpace(mainPadding),
        ContactIconWithName(
          onTap: () => openPhoneCall(callNumber),
          backGroundColor: ColorApp.primeryColorDark,
          icon: Icons.phone_outlined,
          name: 'Call',
        ),
      ],
    );
  }
}
