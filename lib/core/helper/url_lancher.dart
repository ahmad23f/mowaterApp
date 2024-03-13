import 'package:url_launcher/url_launcher_string.dart';

Future<dynamic> openPhoneCall(String phoneNumber) async {
  final url = 'tel:$phoneNumber';
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
  } else {
    throw 'Could not launch $url';
  }
}

Future<dynamic> openWhatsAppChat(String phoneNumber) async {
  final url = 'https://wa.me/$phoneNumber';
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
  } else {
    throw 'Could not launch $url';
  }
}
