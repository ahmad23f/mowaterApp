import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mowaterApp/Features/CareForSaleBrand/presentation/widgets/car_image.dart';
import 'package:mowaterApp/Features/CareForSaleBrand/presentation/widgets/contact_whats_and_call.dart';
import 'package:mowaterApp/Features/CarsForSale/data/model/carModelProduct/car_model_product.dart';
import 'package:mowaterApp/Features/CarsForSale/presentation/cubits/cubit/related_car_cubit.dart';
import 'package:mowaterApp/Features/mowaterMart/presentation/widget/mowater_mart_ads_product_widget.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/constants/size.dart';
import 'package:mowaterApp/core/helper/get_post_when.dart';
import 'package:mowaterApp/core/helper/reqexp.dart';
import 'package:mowaterApp/core/networking/api_constant.dart';
import 'package:mowaterApp/core/routing/routing_name.dart';
import 'package:mowaterApp/core/style/text_style.dart';
import 'package:photo_view/photo_view.dart';

class CarDetailsScreen extends StatefulWidget {
  final CarProduct car;

  const CarDetailsScreen({Key? key, required this.car}) : super(key: key);

  @override
  _CarDetailsScreenState createState() => _CarDetailsScreenState();
}

class _CarDetailsScreenState extends State<CarDetailsScreen> {
  int selectedImage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "${widget.car.carMake} ${widget.car.year}",
            style: TextStyles.text_18.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FullScreenImageView(
                        imageUrls: widget.car.images
                            .map((image) =>
                                ApiConstans.imageCars + image.imageName)
                            .toList(), // Map all image URLs and convert to a list
                        initialIndex: selectedImage,
                      ),
                    ),
                  );
                },
                child: SizedBox(
                  height: 270.h,
                  child: Hero(
                    tag: 'imageHero',
                    child: Image.network(
                      ApiConstans.imageCars +
                          widget.car.images[selectedImage].imageName,
                      width: mediasize(context).width,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: mainPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.car.images.length,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedImage = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            height: 80,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                width: 2,
                                color: selectedImage == index
                                    ? ColorApp.primeryColorDark
                                    : Colors.transparent,
                              ),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(ApiConstans.imageCars +
                                    widget.car.images[index].imageName),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Item overview',
                      style: TextStyles.text_16.copyWith(
                          fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 90,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          CarItemOverviewWidget(
                            title: "Model",
                            icon: const Icon(Icons.stars_outlined),
                            value: widget.car.carModel.toString(),
                          ),
                          CarItemOverviewWidget(
                            title: "YEAR",
                            icon: const Icon(Icons.date_range_outlined),
                            value: widget.car.year.toString(),
                          ),
                          CarItemOverviewWidget(
                            title: "KILOMETERS",
                            icon: const Icon(Icons.speed_rounded),
                            value: widget.car.kilometer.toString(),
                          ),
                          CarItemOverviewWidget(
                            title: "condition",
                            icon: const Icon(Icons.star_rate_outlined),
                            value: widget.car.condition.toString(),
                          ),
                          CarItemOverviewWidget(
                            title: "Door",
                            icon: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Image.asset(
                                'assets/images/carDoorIcon.png',
                                height: 20,
                              ),
                            ),
                            value: widget.car.doors.toString(),
                          ),
                          CarItemOverviewWidget(
                            title: "REGIONAL SPECS",
                            icon: const Padding(
                                padding: EdgeInsets.all(2.0),
                                child: Icon(Icons.map_outlined)),
                            value: widget.car.specifications.toString(),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Additional Details',
                      style: TextStyles.text_16.copyWith(
                          fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                    DetailsRowWidget(
                        title: 'Fuel Type', value: widget.car.fuelType),
                    const DetailsRowWidget(
                        title: 'Seller Type', value: 'seller'),
                    DetailsRowWidget(
                        title: 'Gear Type', value: widget.car.gearBox),
                    DetailsRowWidget(
                        title: 'Warranty',
                        value: widget.car.warranty == 0 ? "without" : "with"),
                    DetailsRowWidget(
                        title: 'No. Of Cylinders',
                        value: widget.car.cylinders.toString()),
                    DetailsRowWidget(
                        title: 'Exterior Color',
                        value: widget.car.exteriorColor!),
                    DetailsRowWidget(
                        title: 'Interior Color',
                        value: widget.car.interiorColor),
                    DetailsRowWidget(
                        title: 'Location', value: widget.car.location),
                    DetailsRowWidget(
                        title: 'Extra Info', value: widget.car.extraInfo ?? ''),
                  ],
                ),
              ),
              Text(
                'Similar Cars',
                style: TextStyles.text_22.copyWith(),
              ),
              verticalSpace(mainPadding),
              const SimilarCarListView(),
              verticalSpace(mainPadding),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: ContactWhatsAndCall(
            callNumber: widget.car.callNumber.toString(),
            whatsAppNumber: widget.car.whatsappNumber.toString(),
          ),
        ),
      ),
    );
  }
}

class FullScreenImageView extends StatefulWidget {
  final List<String> imageUrls;
  final int initialIndex;

  const FullScreenImageView({
    Key? key,
    required this.imageUrls,
    required this.initialIndex,
  }) : super(key: key);

  @override
  _FullScreenImageViewState createState() => _FullScreenImageViewState();
}

class _FullScreenImageViewState extends State<FullScreenImageView> {
  late int currentIndex;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
    pageController = PageController(initialPage: currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView.builder(
            itemCount: widget.imageUrls.length,
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return PhotoView(
                imageProvider: NetworkImage(widget.imageUrls[index]),
                minScale: PhotoViewComputedScale.contained * 0.8,
                maxScale: PhotoViewComputedScale.covered * 2,
                initialScale: PhotoViewComputedScale.contained,
              );
            },
            physics: const BouncingScrollPhysics(),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CarItemOverviewWidget extends StatelessWidget {
  final String title;
  final Widget icon;
  final String value;

  const CarItemOverviewWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: ColorApp.categoryColorDark,
        boxShadow: [
          BoxShadow(
            color: ColorApp.secunderyColorDark,
            blurRadius: 0.5,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyles.text_12.copyWith(fontSize: 12.sp),
            ),
            icon,
            Text(value),
          ],
        ),
      ),
    );
  }
}

class DetailsRowWidget extends StatelessWidget {
  final String title;
  final String value;

  const DetailsRowWidget({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyles.text_12,
              ),
              Expanded(
                child: Text(
                  value,
                  style: TextStyles.text_14,
                  textAlign: TextAlign.end, // Adjust text alignment if needed
                ),
              ),
            ],
          ),
          Divider(
            height: 20.h,
            thickness: 0.5,
          ),
        ],
      ),
    );
  }
}

class SimilarCarListView extends StatelessWidget {
  const SimilarCarListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RelatedCarCubit, RelatedCarState>(
      builder: (context, state) {
        return state.when(
          initial: () {
            return const SizedBox.shrink();
          },
          succss: (cars) => SizedBox(
            height: 220.h,
            child: ListView.builder(
              itemCount: cars.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  context.push(RouteName.carDetailsScreen, extra: cars[index]);
                },
                child: SmallCarWidget(car: cars[index]),
              ),
            ),
          ),
          loading: () => const CircularProgressIndicator.adaptive(),
          faliure: () => const Text('No Similar Cars Yet !'),
        );
      },
    );
  }
}

class SmallCarWidget extends StatelessWidget {
  CarProduct car;
  SmallCarWidget({
    required this.car,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 200.w,
        margin: const EdgeInsets.symmetric(horizontal: mainPadding),
        decoration: BoxDecoration(
          color: ColorApp.secunderyColorDark,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CarImageWidget(images: car.images)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'AED ',
                        style: TextStyles.text_10.copyWith(
                            color: ColorApp.primeryColorDark,
                            shadows: [
                              const BoxShadow(
                                  color: Colors.black,
                                  spreadRadius: 20,
                                  blurRadius: 10)
                            ]),
                      ),
                      Text(
                        car.price.toString(),
                        style: TextStyles.text_14,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: ColorApp.primeryColorDark,
                        size: 15,
                      ),
                      Text(
                        car.location,
                        style: TextStyles.text_10.copyWith(
                          fontSize: 10.sp,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        AppRegex.extractEnglishText(
                          car.carMake,
                        ),
                        style: TextStyles.text_12,
                      ),
                      Text(
                        " - ${car.carModel}",
                        style: TextStyles.text_12,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month_outlined,
                        size: 15,
                        color: ColorApp.primeryColorDark,
                      ),
                      Text(
                        car.year.toString(),
                        style: TextStyles.text_14,
                      ),
                    ],
                  ),
                  car.isAds == 0
                      ? Text(
                          calculateTimeDifference(car.createdAt),
                          style: TextStyles.text_10,
                        )
                      : const PremiumWidget()
                ],
              ),
            ),
          ],
        ));
  }
}
