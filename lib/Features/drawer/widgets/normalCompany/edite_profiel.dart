import 'dart:io';

import 'package:Mowater/Features/ServiceProvider%20%20Company/presntation/widgets/day_week_dialgo.dart';
import 'package:Mowater/Features/carNumbers/presntation/sell_your_plate_screen.dart';
import 'package:Mowater/Features/drawer/widgets/car_make_chip_chose.dart';
import 'package:Mowater/Features/serviceProverAuth/presnation/widgets/get_specialty_by_main_categoyr.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/helper/get_city_name_by_lat_long_tude.dart';
import 'package:Mowater/core/services/user_state.dart';
import 'package:Mowater/core/style/text_style.dart';
import 'package:Mowater/core/widgets/button.dart';
import 'package:Mowater/core/widgets/snak_bar.dart';
import 'package:Mowater/core/widgets/text_form_fiedl.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EditNormalCompanyProfile extends StatefulWidget {
  const EditNormalCompanyProfile({
    Key? key,
  }) : super(key: key);

  @override
  _EditNormalCompanyProfileState createState() =>
      _EditNormalCompanyProfileState();
}

class _EditNormalCompanyProfileState extends State<EditNormalCompanyProfile> {
  late TextEditingController tradeNameController;
  late TextEditingController carNameController;
  late TextEditingController numberController;
  late TextEditingController whatsappNumberController;
  late TextEditingController descriptionController; // New field

  File? _image;
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  double? latitude;
  double? longitude;
  String? selectedSpecialties;
  bool mowaterDiscount = true;
  List<int> selectedServiceSpecialty = [];
  List<String> selectedDays = [];
  List<int> selectedCarsMake = [];
  @override
  void initState() {
    super.initState();
    tradeNameController =
        TextEditingController(text: UserServices.getUserInformation().nickName);
    carNameController = TextEditingController();
    numberController = TextEditingController(
        text: UserServices.getUserInformation().phoneNumber);
    whatsappNumberController = TextEditingController(
        text: UserServices.getUserInformation().whatsAppNumber);
    descriptionController =
        TextEditingController(); // Initialize new field controller
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Company Information'.tr(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                _selectFile(FileType.image);
              },
              child: Center(
                child: Container(
                  width: 120.w,
                  height: 120.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.withOpacity(0.2),
                  ),
                  child: _image != null
                      ? ClipOval(
                          child: Image.file(
                            _image!,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Stack(
                          children: [
                            Positioned(
                              left: 0,
                              right: 0,
                              bottom: 0,
                              top: 0,
                              child: Icon(
                                Icons.store_outlined,
                                size: 70.dg,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 10,
                              child: Center(
                                child: Container(
                                  padding: EdgeInsets.all(5.dg),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    size: 20,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                ),
              ),
            ),
            SizedBox(height: 12.h), // Add spacing
            Text(
              'Trade Name'.tr(),
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            CustomTextFormField(
              controller: tradeNameController,
              hintText: 'Trade Name'.tr(),
            ),
            SizedBox(height: 12.h),

            CustomTextFormField(
              hintText: 'number phone'.tr(),
              controller: numberController,
            ),
            SizedBox(height: 12.h),
            Text(
              'WhatsApp Number'.tr(),
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            CustomTextFormField(
              controller: whatsappNumberController,
              hintText: 'whatsapp number'.tr(),
            ),
            SizedBox(height: 12.h),
            Text(
              'Description'.tr(), // New field
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            CustomTextFormField(
              maxLine: 7,
              controller: descriptionController,
              inputType: TextInputType.multiline,
              hintText: 'Description'.tr(),
            ),
            SizedBox(height: 12.h),
            Text(
              'Mowater Discount'.tr(),
              style: const TextStyle(color: Colors.white), // Black text color
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context)
                    .colorScheme
                    .secondary, // Grey background color
                borderRadius: BorderRadius.circular(10), // Rounded corners
              ),
              child: CheckboxListTile(
                title: Text(
                  'Enable Mowater Discount'.tr(),
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.6)), // Black text color
                ),
                value: mowaterDiscount,
                onChanged: (value) {
                  setState(() {
                    mowaterDiscount = value!;
                  });
                },
                controlAffinity: ListTileControlAffinity.trailing,
                activeColor: ColorApp.primeryColorDark,
                tileColor:
                    Colors.transparent, // Make the tile background transparent
                checkColor: Colors.white, // Color of the checkmark
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              'Service Specialty'.tr(),
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              child: SizedBox(
                child: SpecialtyDropDownByMainCategory(
                  mainCategory: 'Maintenance'.tr(),
                  onSpecialtiesChanged: (value) {
                    selectedServiceSpecialty = value;
                  },
                ),
              ),
            ),
            Divider(
              height: 10.h,
            ),
            verticalSpace(12.h),
            Text(
              'Cars Specialty'.tr(),
              style: TextStyles.text_14,
            ),

            Container(
              clipBehavior: Clip.none,
              height: 300,
              child: SingleChildScrollView(
                child: CarNameDropChipChoseWidget(
                    onChanged: (p0) {
                      selectedServiceSpecialty = p0;
                    },
                    carNameController: carNameController),
              ),
            ),

            SizedBox(height: 15.h),
            Row(
              children: [
                Text(
                  'work days'.tr(),
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      List<String>? result = await showDialog(
                        context: context,
                        builder: (context) => const DayWeekDialog(),
                      );
                      if (result != null) {
                        setState(() {
                          selectedDays = result;
                        });
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 15.0.dg, horizontal: 5.dg),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      child: Text(
                        selectedDays.isEmpty
                            ? 'Days work'.tr()
                            : selectedDays.join(', '),
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Start Time'.tr(),
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          final TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (pickedTime != null && pickedTime != startTime) {
                            setState(() {
                              endTime = pickedTime;
                            });
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 15.h, horizontal: 10.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                endTime != null
                                    ? _formatTime(endTime!)
                                    : 'Select'.tr(),
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16.sp),
                              ),
                              Text(
                                startTime != null
                                    ? _getPeriod(endTime ??
                                        const TimeOfDay(hour: 0, minute: 0))
                                    : '',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10.w),
                Text(
                  'To'.tr(),
                  style: TextStyle(
                    fontSize: 18.sp,
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'End Time'.tr(),
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          final TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (pickedTime != null && pickedTime != startTime) {
                            setState(() {
                              startTime = pickedTime;
                            });
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 15.h, horizontal: 10.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                startTime != null
                                    ? _formatTime(startTime!)
                                    : 'Select'.tr(),
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16.sp),
                              ),
                              Text(
                                startTime != null ? _getPeriod(startTime!) : '',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),

            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      return showDialog(
                        context: context,
                        builder: (context) => MapPickerDialog(
                          onSelected: (LatLng location) {
                            setState(() {
                              latitude = location.latitude;
                              longitude = location.longitude;
                            });
                          },
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(12.dg)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.map_outlined),
                          Text(
                            latitude != null && longitude != null
                                ? 'Location Selected'.tr()
                                : 'Select Location on Map'.tr(),
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16.0.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20.h),

            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    color: ColorApp.primeryColorDark,
                    textStyle: TextStyles.text_16.copyWith(color: Colors.white),
                    text: 'Update Account'.tr(),
                    onPressed: () async {
                      setState(() {});

                      // Check if all required inputs are valid
                      if (_validateInputs()) {
                        await updateAcocunt();

                        setState(() {});
                      }
                    },
                  ),
                ),
              ],
            ),

            Divider(
              height: 30.h,
              endIndent: 20.w,
              indent: 20.w,
            ),

            // BlocBuilder<ProviderServiceAuthCubit, ProviderServiceAuthState>(
            //   builder: (context, state) {
            //     return state.when(
            //         initial: () => const SizedBox(),
            //         success: (statusApiResponse) {
            //           Future.delayed(
            //               Duration.zero,
            //               () => context.go(RouteName.thankYouForRegister,
            //                   extra: selectedSpecialties));

            //           return const SizedBox();
            //         },
            //         failure: (errorMessage) {
            //           Future.delayed(
            //               Duration.zero,
            //               () => ShowSnakBar(
            //                     duration: 7,
            //                     context,
            //                     content: errorMessage,
            //                     title: 'Failure',
            //                     backGroundColor:
            //                         const Color.fromARGB(255, 98, 22, 18),
            //                   ));
            //           return const SizedBox();
            //         },
            //         loading: () => const SizedBox());
            //   },
            // )
          ],
        ),
      ),
    );
  }

  updateAcocunt() async {
    // print(phoneNumber.text);
    // await context.read<EditeNormalCompanyCubit>().editMaintenanceProfile(
    //       MaintenanceCompanyModel(
    //           name: tradeNameController.text,
    //           carMakes: selectedCarsMake.join(','),
    //           phoneNumber: phoneNumber.text,
    //           whatsappNumber: whatsappNumberController.text,
    //           description: descriptionController.text,
    //           image: _image?.path ?? UserServices.getUserInformation().image,
    //           specialty: selectedServiceSpecialty.join(','),
    //           weekdayWork: selectedDays.join(','),
    //           startTime: _formatTime(startTime!),
    //           endTime: _formatTime(endTime!),
    //           latitude: latitude.toString(),
    //           longitude: longitude.toString(),
    //           location: await getCityName(latitude!, longitude!),
    //           mowaterDiscount: mowaterDiscount == true ? 1 : 0),
    //     );
  }

  void _selectFile(FileType fileType, {List<String>? allowedExtensions}) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: fileType,
      allowedExtensions: allowedExtensions,
    );

    if (result != null) {
      setState(() {
        if (fileType == FileType.image) {
          _image = File(result.files.single.path!);
        }
      });
    }
  }

  String _formatTime(TimeOfDay timeOfDay) {
    return '${timeOfDay.hourOfPeriod}:${timeOfDay.minute} ${timeOfDay.period == DayPeriod.am ? 'AM' : 'PM'}';
  }

  String _getPeriod(TimeOfDay timeOfDay) {
    return timeOfDay.period == DayPeriod.am ? 'AM' : 'PM';
  }

  bool _validateInputs() {
    if (_image == null) {
      ShowSnakBar(
        context,
        content: 'Please select an image'.tr(),
        title: 'Failure'.tr(),
        backGroundColor: const Color.fromARGB(255, 98, 22, 18),
      );
      return false;
    }

    if (selectedDays.isEmpty) {
      ShowSnakBar(
        context,
        content: 'Please select work days'.tr(),
        title: 'Failure'.tr(),
        backGroundColor: const Color.fromARGB(255, 98, 22, 18),
      );
      return false;
    }
    if (startTime == null || endTime == null) {
      ShowSnakBar(
        context,
        content: 'Please select working hours'.tr(),
        title: 'Failure'.tr(),
        backGroundColor: const Color.fromARGB(255, 98, 22, 18),
      );
      return false;
    }
    if (latitude == null || longitude == null) {
      ShowSnakBar(
        context,
        content: 'Please select your location on map'.tr(),
        title: 'Failure'.tr(),
        backGroundColor: const Color.fromARGB(255, 98, 22, 18),
      );
      return false;
    }

    return true;
  }
}

class MapPickerDialog extends StatefulWidget {
  final Function(LatLng) onSelected;

  const MapPickerDialog({Key? key, required this.onSelected}) : super(key: key);

  @override
  _MapPickerDialogState createState() => _MapPickerDialogState();
}

class _MapPickerDialogState extends State<MapPickerDialog> {
  late GoogleMapController _mapController;
  LatLng? _pickedLocation;

  void _selectLocation(LatLng position) {
    setState(() {
      _pickedLocation = position;
    });
    widget.onSelected(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(37.7749, -122.4194),
              zoom: 16,
            ),
            onTap: _selectLocation,
            onMapCreated: (GoogleMapController controller) {
              _mapController = controller;
            },
            markers: _pickedLocation != null
                ? {
                    Marker(
                      markerId: const MarkerId('m1'),
                      position: _pickedLocation!,
                    ),
                  }
                : {},
          ),
          Positioned(
            bottom: 20.0,
            left: 16.0,
            right: 16.0,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Save'.tr(),
                style: TextStyles.text_16.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
