// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Mowater/core/constants/size.dart';

class TrendingWidget extends StatelessWidget {
  String image;

  TrendingWidget({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270.h,
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3), BlendMode.darken),
              image: CachedNetworkImageProvider(image)),
          color: const Color.fromARGB(255, 162, 165, 165),
          borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.all(20),
      width: mediasize(context).width,
    );
  }
}
