import 'dart:typed_data';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show Uint8List, rootBundle;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:Mowater/Features/CareForSaleBrand/presentation/widgets/contact_whats_and_call.dart';
import 'package:Mowater/Features/Service24/data/cubit/recovery_cubit.dart';
import 'package:Mowater/Features/Service24/models/recovery_model.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/helper/reqexp.dart';
import 'package:Mowater/core/style/text_style.dart';

class Service24Screen extends StatefulWidget {
  const Service24Screen({Key? key}) : super(key: key);

  @override
  _Service24ScreenState createState() => _Service24ScreenState();
}

class _Service24ScreenState extends State<Service24Screen> {
  String selectedCategory = 'Recovery'.tr();
  late GoogleMapController mapController;
  LatLng _initialLocation = const LatLng(0.0, 0.0);
  bool _permissionGranted = false;
  late List<RecoveryModel> companies; // List of companies
  late String darkModeMapStyleJson; // Variable to hold the JSON data
  bool _bottomSheetVisible = true; // Variable to track bottom sheet visibility
  late Position position;

  @override
  void initState() {
    super.initState();
    // _addCustomIcon();

    _loadDarkModeMapStyle(); // Load dark mode map style JSON
    _requestLocationPermission();
    getCustomMarker();
    // Initialize companies with sample data
    companies = [];
  }

  // void _addCustomIcon() {
  //   BitmapDescriptor.fromAssetImage(
  //     const ImageConfiguration(size: Size(1, 1)),
  //     'assets/images/recovery_icon_google_map.png',
  //   ).then((icom) {
  //     setState(() {
  //       customMarker = icom;
  //     });
  //   });
  // }

  Future<BitmapDescriptor> getCustomMarker() async {
    final Uint8List markerIcon =
        await getBytesFromAsset('assets/custom_marker.png', 1);
    return BitmapDescriptor.fromBytes(markerIcon, size: const Size(1, 1));
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    Codec codec = await instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(
      format: ImageByteFormat.png,
    ))!
        .buffer
        .asUint8List();
  }

  // Load dark mode map style JSON from the file
  Future<void> _loadDarkModeMapStyle() async {
    final String darkModeJsonString =
        await rootBundle.loadString('assets/24Service/google_map_style.json');
    setState(() {
      darkModeMapStyleJson = darkModeJsonString;
    });
  }

  // Request location permission
  Future<void> _requestLocationPermission() async {
    // Request permission using Geolocator package
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      setState(() {
        _permissionGranted = true;
      });
      _getCurrentLocation();
    }
  }

  // Get current location using Geolocator package
  Future<void> _getCurrentLocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _initialLocation = LatLng(position.latitude, position.longitude);
    });
    await context.read<Service24Cubit>().getNearestRecovery(
        position.latitude, position.longitude, 'recoveryCompanies'.tr());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildMap());
  }

  Widget _buildMap() {
    return _initialLocation == const LatLng(0.0, 0.0)
        ? const Center(child: CircularProgressIndicator())
        : BlocBuilder<Service24Cubit, RecoveryState>(builder: (context, state) {
            return state.when(
                initial: () => const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                success: (companies) {
                  return MapBody(companies, context);
                },
                faliure: () {
                  return Text('No Internet'.tr());
                },
                loading: () => MapBody([], context));
          });
  }

  SafeArea MapBody(List<RecoveryModel> companies, BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          GoogleMap(
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: _bottomSheetVisible ? false : true,
            markers: Set<Marker>.from(
              companies.map(
                (company) => Marker(
                  markerId: MarkerId(company.id.toString()),
                  position: LatLng(
                    double.parse(company.latitude), // Parse location to double
                    double.parse(
                        company.longitude), // Parse longitude to double
                  ),
                  onTap: () {
                    companies.isEmpty
                        ? const SizedBox()
                        : _showCompanyInfo(company);
                  },
                ),
              ),
            ),
            onMapCreated: (GoogleMapController controller) {
              setState(() {
                mapController = controller;
              });
              mapController.setMapStyle(
                darkModeMapStyleJson,
              );
            },
            initialCameraPosition: CameraPosition(
              target: _initialLocation,
              zoom: 16.0,
            ),
          ),
          Positioned(
            bottom: _bottomSheetVisible ? 0 : -380.h,
            left: 0,
            right: 0,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _bottomSheetVisible = !_bottomSheetVisible;
                    });
                  },
                  child: Icon(
                    _bottomSheetVisible
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_up,
                    size: 40.dg,
                  ),
                ),
                companies.isEmpty
                    ? SizedBox(
                        height: 380.h,
                        child: const Center(
                            child: CircularProgressIndicator.adaptive()))
                    : Visibility(
                        visible: true,
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          height: 380.h,
                          width: mediasize(context).width,
                          child: Column(
                            children: [
                              CarouselSlider.builder(
                                  itemCount: companies.length,
                                  itemBuilder: (context, index, realIndex) =>
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 5.w),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: const Color.fromARGB(
                                                255,
                                                204,
                                                204,
                                                204,
                                              ).withOpacity(0.2),
                                              blurRadius: 7,
                                              offset: Offset.zero,
                                            ),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 160.h,
                                              width: 300.w,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: Image.network(
                                                  companies[index].image,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8.0.dg),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Divider(
                                                    height: 20,
                                                    endIndent: 10.w,
                                                    indent: 10.w,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        companies[index].name,
                                                        style:
                                                            TextStyles.text_16,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .location_on_outlined,
                                                            size: 15,
                                                            color: ColorApp
                                                                .primeryColorDark,
                                                            shadows: const [
                                                              Shadow(
                                                                  color: Colors
                                                                      .black,
                                                                  blurRadius: 5)
                                                            ],
                                                          ),
                                                          Text(
                                                            companies[index]
                                                                .location,
                                                            style: TextStyles
                                                                .text_16
                                                                .copyWith(
                                                              shadows: [
                                                                const Shadow(
                                                                    color: Colors
                                                                        .black,
                                                                    blurRadius:
                                                                        5)
                                                              ],
                                                              color: ColorApp
                                                                  .primeryColorDark,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        companies[index]
                                                            .weeksDayWork
                                                            .first,
                                                        style:
                                                            TextStyles.text_12,
                                                      ),
                                                      Text(
                                                        ' - ',
                                                        style:
                                                            TextStyles.text_12,
                                                      ),
                                                      Text(
                                                        companies[index]
                                                            .weeksDayWork
                                                            .last,
                                                        style:
                                                            TextStyles.text_12,
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                          AppRegex
                                                              .formatDistance(
                                                            companies[index]
                                                                .distance,
                                                          ),
                                                          style: TextStyles
                                                              .text_12),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 8),
                                                  ContactWhatsAndCall(
                                                      callNumber:
                                                          companies[index]
                                                              .phoneNumber,
                                                      whatsAppNumber:
                                                          companies[index]
                                                              .whatsAppNumber),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                  options: CarouselOptions(
                                      enlargeCenterPage: true,
                                      aspectRatio: 10 / 9)),
                            ],
                          ),
                        ),
                      ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            right: 0,
            left: 0,
            child: AppBar(
              title: SizedBox(
                height: 50.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    FilterMapWidget(
                      categoryName: 'Recovery'.tr(),
                      selectedName: selectedCategory,
                      onTap: () async {
                        selectedCategory = 'Recovery'.tr();

                        setState(() {});
                        await context.read<Service24Cubit>().getNearestRecovery(
                            position.latitude,
                            position.longitude,
                            'recoveryCompanies'.tr());
                      },
                    ),
                    FilterMapWidget(
                      categoryName: 'Battry'.tr(),
                      selectedName: selectedCategory,
                      onTap: () async {
                        selectedCategory = 'Battry'.tr();
                        setState(() {});
                        await context.read<Service24Cubit>().getNearestRecovery(
                            position.latitude,
                            position.longitude,
                            'BatteryCompanies'.tr());
                      },
                    ),
                    FilterMapWidget(
                      onTap: () async {
                        selectedCategory = 'Tiers'.tr();
                        setState(() {});
                        await context.read<Service24Cubit>().getNearestRecovery(
                            position.latitude,
                            position.longitude,
                            'TiersCompanies'.tr());
                      },
                      categoryName: 'Tiers'.tr(),
                      selectedName: selectedCategory,
                    ),
                    FilterMapWidget(
                      onTap: () async {
                        selectedCategory = 'Electic Charger'.tr();
                        setState(() {});
                        await context.read<Service24Cubit>().getNearestRecovery(
                            position.latitude,
                            position.longitude,
                            'electricCaCharger'.tr());
                      },
                      categoryName: 'Electic Charger'.tr(),
                      selectedName: selectedCategory,
                    ),
                  ],
                ),
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_sharp),
                onPressed: () => context.pop(),
              ),
            ),
          ),
          _bottomSheetVisible == false
              ? Positioned(
                  bottom: 150.h,
                  right: 10.w,
                  child: FloatingActionButton(
                    backgroundColor: const Color.fromARGB(255, 97, 97, 97),
                    onPressed: () {
                      mapController.animateCamera(
                        CameraUpdate.newLatLng(
                          LatLng(position.latitude, position.longitude),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.my_location_outlined,
                      color: Colors.white,
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  void _showCompanyInfo(RecoveryModel company) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          width: mediasize(context).width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 250.h,
                width: mediasize(context).width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    company.image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Divider(
                height: 20,
                endIndent: 10.w,
                indent: 10.w,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(company.name, style: TextStyles.text_20),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: ColorApp.primeryColorDark,
                        ),
                        Text(company.location, style: TextStyles.text_20),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ContactWhatsAndCall(
                        callNumber: company.phoneNumber,
                        whatsAppNumber: company.whatsAppNumber),
                    verticalSpace(40.h)
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class FilterMapWidget extends StatelessWidget {
  String categoryName;
  void Function()? onTap;
  String selectedName;
  FilterMapWidget(
      {super.key,
      required this.categoryName,
      this.onTap,
      required this.selectedName});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: AnimatedContainer(
            margin: EdgeInsets.only(right: 15.dg),
            padding: EdgeInsets.all(8.dg),
            decoration: BoxDecoration(
                color: selectedName == categoryName
                    ? ColorApp.primeryColorDark
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: ColorApp.primeryColorDark)),
            duration: const Duration(
              milliseconds: 300,
            ),
            child: Text(
              textAlign: TextAlign.center,
              categoryName,
              style: TextStyles.text_14,
            ),
          ),
        ),
      ),
    );
  }
}
