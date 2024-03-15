import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:Mowater/Features/home/models/trendingModel/trend_model.dart';
import 'package:Mowater/Features/home/presentation/widgets/trending/trending_widget.dart';

class TrendinglistView extends StatelessWidget {
  final List<TrendingModel> trendings;

  const TrendinglistView({Key? key, required this.trendings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: trendings.length,
      itemBuilder: (context, index, realIndex) => TrendingWidget(
        image: trendings[index].image,
      ),
      options: CarouselOptions(
        viewportFraction: 1,
        autoPlay: true,
      ),
    );
  }
}
