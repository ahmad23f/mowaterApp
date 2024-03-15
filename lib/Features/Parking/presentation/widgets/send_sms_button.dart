import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Mowater/Features/Parking/data/plateService/plate_service.dart';
import 'package:Mowater/Features/Parking/models/plate_model.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/style/text_style.dart';
import 'package:Mowater/core/widgets/button.dart';
import 'package:Mowater/core/widgets/snak_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class SendSmsButton extends StatelessWidget {
  String smsBody;
  String toNumber;
  PlateModel selectedPlate;
  SendSmsButton(
      {super.key,
      required this.smsBody,
      required this.selectedPlate,
      required this.toNumber});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      padding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 10),
      onPressed: () async {
        // Construct the SMS body with parking details

        // Encode the message body for URL
        String encodedBody = Uri.encodeComponent(smsBody);

        // Construct the SMS URI
        String uri = 'sms:$toNumber?body=$encodedBody';

        try {
          // Launch the SMS app with the pre-filled message
          await launchUrl(Uri.parse(uri), mode: LaunchMode.platformDefault);
          await PlateService.findPlateIndexByCode(PlateModel(
              lastUse: DateTime.now(),
              nickName: selectedPlate.nickName,
              plateNumber: selectedPlate.plateNumber,
              plateSource: selectedPlate.plateSource,
              plateCode: selectedPlate.plateCode));
        } catch (e) {
          ShowSnakBar(
            context,
            title: 'Failure',
            iconData: Icons.info_outline_rounded,
            messageTextStyle:
                TextStyles.text_16.copyWith(fontWeight: FontWeight.bold),
            content: 'There Was Unkown Error Well Fix It Soon!',
            subtitleTextStyle: TextStyles.text_16,
            backGroundColor: Theme.of(context).colorScheme.secondary,
          );
        }
      },
      color: ColorApp.primeryColorDark,
      textStyle: TextStyles.text_24
          .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
      text: 'Send',
    );
  }
}
