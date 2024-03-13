import 'package:flutter/cupertino.dart';

const double mainPadding = 12;
const double mainSpace = 12;
Size mediasize(context) {
  return MediaQuery.of(context).size;
}

Widget verticalSpace(double height) {
  return SizedBox(
    height: height,
  );
}

Widget horizontalSpace(double width) {
  return SizedBox(
    width: width,
  );
}

int crorAxixCount(context) {
  if (mediasize(context).width < 250) {
    return 1;
  } else if (mediasize(context).width > 250 && mediasize(context).width < 342) {
    return 2;
  } else if (mediasize(context).width > 340 && mediasize(context).width < 600) {
    return 3;
  } else if (mediasize(context).width > 601 &&
      mediasize(context).width < 1000) {
    return 4;
  } else if (mediasize(context).width > 1000 &&
      mediasize(context).width < 1200) {
    return 4;
  } else {
    return 4;
  }
}
