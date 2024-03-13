import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mowaterApp/core/widgets/loading/shimmer_widget.dart';

class SearchProductLoading extends StatelessWidget {
  const SearchProductLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) => Card(
          child: ListTile(
              subtitle: ShimmerWidget(width: 60.w, height: 20.h),
              title: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ShimmerWidget(width: 40.w, height: 20.h),
              ),
              trailing: ShimmerWidget(width: 80.w, height: 20.h),
              leading: ShimmerWidget(width: 100.w, height: 150.h))),
    );
  }
}
