import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mowaterApp/Features/home/presentation/widgets/trending/trending_widget.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/constants/size.dart';
import 'package:mowaterApp/core/style/text_style.dart';

class TrendingScreen extends StatefulWidget {
  const TrendingScreen({Key? key}) : super(key: key);

  @override
  _TrendingScreenState createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _showScrollTopButton = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >=
        0.4 * _scrollController.position.maxScrollExtent) {
      setState(() {
        _showScrollTopButton = true;
      });
    } else {
      setState(() {
        _showScrollTopButton = false;
      });
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.dg),
      child: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0.dg),
                      child: Text(
                        "Trending Cars",
                        style: TextStyles.text_18.copyWith(fontSize: 18.sp.h),
                      ),
                    ),
                    Icon(
                      Icons.local_fire_department_outlined,
                      color: ColorApp.primeryColorDark,
                    ),
                  ],
                ),
                SizedBox(
                  height: 232.h,
                  width: mediasize(context).width.w,
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                        viewportFraction: 1, aspectRatio: 10.5 / 9),
                    itemCount: 20,
                    itemBuilder: (context, index, realIndex) =>
                        TrendingWidget(image: 'image'),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0.dg),
                      child: Text(
                        "Trending Providers",
                        style: TextStyles.text_18.copyWith(fontSize: 18.sp.h),
                      ),
                    ),
                    Icon(
                      Icons.local_fire_department_outlined,
                      color: ColorApp.primeryColorDark,
                    ),
                  ],
                ),
                SizedBox(
                  width: mediasize(context).width.w,
                  height: 100.h,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      height: 100.h,
                      width: 100.w,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0.dg),
                      child: Text(
                        "Trending News",
                        style: TextStyles.text_18.copyWith(fontSize: 18.sp.h),
                      ),
                    ),
                    Icon(
                      Icons.local_fire_department_outlined,
                      color: ColorApp.primeryColorDark,
                    ),
                  ],
                ),
                SizedBox(
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 20,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      height: 270.h,
                      width: 200.w,
                    ),
                  ),
                ),
                SizedBox(height: 60.h),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Visibility(
              visible: _showScrollTopButton,
              child: IconButton(
                icon: const Icon(Icons.arrow_upward),
                onPressed: _scrollToTop,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
