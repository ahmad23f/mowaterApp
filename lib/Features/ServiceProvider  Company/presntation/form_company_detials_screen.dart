import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mowaterApp/Features/ServiceProvider%20%20Company/model/service_account.dart';
import 'package:mowaterApp/Features/ServiceProvider%20%20Company/presntation/providerServicesAuth/provider_service_auth_cubit.dart';
import 'package:mowaterApp/Features/ServiceProvider%20%20Company/presntation/widgets/day_week_dialgo.dart';
import 'package:mowaterApp/Features/serviceProverAuth/presnation/widgets/specialty_drop_down.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/routing/routing_name.dart';
import 'package:mowaterApp/core/style/text_style.dart';
import 'package:mowaterApp/core/widgets/animation_loading_button.dart';
import 'package:mowaterApp/core/widgets/snak_bar.dart';
import 'package:mowaterApp/core/widgets/text_form_fiedl.dart';

class ServiceProviderChoseTypeAccountScreen extends StatefulWidget {
  const ServiceProviderChoseTypeAccountScreen({
    Key? key,
  }) : super(key: key);

  @override
  _ServiceProviderChoseTypeAccountScreenState createState() =>
      _ServiceProviderChoseTypeAccountScreenState();
}

class _ServiceProviderChoseTypeAccountScreenState
    extends State<ServiceProviderChoseTypeAccountScreen> {
  late TextEditingController tradeNameController;
  late TextEditingController commercialLicenseNumberController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController numberController;
  late TextEditingController whatsappNumberController;
  late TextEditingController descriptionController; // New field

  File? _image;
  File? _pdfFile;
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  double? latitude;
  double? longitude;
  List<String> selectedDays = [];
  String? selectedSpecialties;
  bool mowaterDiscount = true;
  List<String> selectedServiceSpecialty = [];

  @override
  void initState() {
    super.initState();
    tradeNameController = TextEditingController();
    commercialLicenseNumberController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    numberController = TextEditingController();
    whatsappNumberController = TextEditingController();
    descriptionController =
        TextEditingController(); // Initialize new field controller
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Company Information',
          style: TextStyle(
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
                                    color: ColorApp.secunderyColorDark,
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
              'Trade Name',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            CustomTextFormField(
              controller: tradeNameController,
              hintText: 'Trade Name',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Trade Name is required';
                }
                return null;
              },
            ),
            SizedBox(height: 12.h),
            Text(
              'Commercial License Number',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            CustomTextFormField(
              controller: commercialLicenseNumberController,
              hintText: 'Commercial license number',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Commercial license number is required';
                }
                return null;
              },
            ),
            SizedBox(height: 12.h),
            Text(
              'Password',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            CustomTextFormField(
              controller: passwordController,
              hintText: 'Password',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password is required';
                }
                return null;
              },
            ),
            SizedBox(height: 12.h),
            Text(
              'Confirm Password',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            CustomTextFormField(
              controller: confirmPasswordController,
              hintText: 'Confirm Password',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please confirm your password';
                } else if (value != passwordController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
            ),
            SizedBox(height: 12.h),
            Text(
              'Number',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            CustomTextFormField(
              hintText: 'number phone',
              controller: numberController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Number is required';
                }
                return null;
              },
            ),
            SizedBox(height: 12.h),
            Text(
              'WhatsApp Number',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            CustomTextFormField(
              controller: whatsappNumberController,
              hintText: 'whatsapp number',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'WhatsApp Number is required';
                }
                return null;
              },
            ),
            SizedBox(height: 12.h),
            Text(
              'Description', // New field
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),

            CustomTextFormField(
              maxLine: 7,
              controller: descriptionController,
              inputType: TextInputType.multiline,
              hintText: 'Description',
            ),
            SizedBox(height: 12.h),
            const Text(
              'Mowater Discount',
              style: TextStyle(color: Colors.white), // Black text color
            ),
            Container(
              decoration: BoxDecoration(
                color: ColorApp.secunderyColorDark, // Grey background color
                borderRadius: BorderRadius.circular(10), // Rounded corners
              ),
              child: CheckboxListTile(
                title: Text(
                  'Enable Mowater Discount',
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
              'Service Specialty',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SpecialtyDropDown(
              onCategoryChanged: (value) {
                selectedSpecialties = value;
              },
              onSpecialtiesChanged: (specialty) {
                print(specialty.first);
                setState(() {
                  selectedServiceSpecialty = specialty;
                });
              },
            ),
            SizedBox(height: 15.h),
            Row(
              children: [
                Text(
                  'work days',
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
                        builder: (context) =>
                            const DayWeekDialog(initialSelectedDays: []),
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
                        color: ColorApp.secunderyColorDark,
                      ),
                      child: Text(
                        selectedDays.isEmpty
                            ? 'Days work'
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
                        'Start Time',
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
                            color: ColorApp.secunderyColorDark,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                endTime != null
                                    ? _formatTime(endTime!)
                                    : 'Select',
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
                  'To',
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
                        'End Time',
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
                            color: ColorApp.secunderyColorDark,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                startTime != null
                                    ? _formatTime(startTime!)
                                    : 'Select',
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
                          color: ColorApp.secunderyColorDark,
                          borderRadius: BorderRadius.circular(12.dg)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.map_outlined),
                          Text(
                            latitude != null && longitude != null
                                ? 'Location Selected'
                                : 'Select Location on Map',
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
                  child: GestureDetector(
                    onTap: () async {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(
                            height: 150.h,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    _selectFile(FileType.custom,
                                        allowedExtensions: ['pdf']);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Upload pdf',
                                      style: TextStyle(
                                          fontSize: 16.sp, color: Colors.white),
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    _selectFile(FileType.any);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Choose from Gallery',
                                      style: TextStyle(
                                          fontSize: 16.sp, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.file_upload_outlined),
                        Container(
                          padding: EdgeInsets.all(10.0.dg),
                          child: _pdfFile != null
                              ? Text(
                                  'Attachment Selected',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 16.0.sp),
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Upload  a ',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 16.sp),
                                    ),
                                    Text(
                                      'Attachment',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          color: ColorApp.primeryColorDark),
                                    ),
                                  ],
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: LoadingButton(
                    buttonText: 'Create Account',
                    isLoading:
                        context.read<ProviderServiceAuthCubit>().isLoading,
                    onPressed: () async {
                      if (_validateInputs()) {
                        setState(() {});

                        await createAccount();
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: TextStyles.text_16,
                ),
                InkWell(
                  onTap: () {
                    context.push(RouteName.loginServiceProvider);
                  },
                  child: Text(
                    "Login Now!",
                    style: TextStyles.text_16.copyWith(
                        color: ColorApp.primeryColorDark,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),

            BlocBuilder<ProviderServiceAuthCubit, ProviderServiceAuthState>(
              builder: (context, state) {
                return state.when(
                    initial: () => const SizedBox(),
                    success: (statusApiResponse) {
                      Future.delayed(
                          Duration.zero,
                          () => context.go(RouteName.thankYouForRegister,
                              extra: selectedSpecialties));

                      return const SizedBox();
                    },
                    failure: (errorMessage) {
                      Future.delayed(
                          Duration.zero,
                          () => ShowSnakBar(
                                duration: 7,
                                context,
                                content: errorMessage,
                                title: 'Failure',
                                backGroundColor:
                                    const Color.fromARGB(255, 98, 22, 18),
                              ));
                      return const SizedBox();
                    },
                    loading: () => const SizedBox());
              },
            )
          ],
        ),
      ),
    );
  }

  bool _validateInputs() {
    // if (_image == null) {
    //   ShowSnakBar(
    //     context,
    //     content: 'Please select an image',
    //     title: 'Failure',
    //     backGroundColor: const Color.fromARGB(255, 98, 22, 18),
    //   );
    //   return false;
    // }
    if (tradeNameController.text.isEmpty) {
      ShowSnakBar(
        context,
        content: 'Trade name cannot be empty',
        title: 'Failure',
        backGroundColor: const Color.fromARGB(255, 98, 22, 18),
      );
      return false;
    }
    if (commercialLicenseNumberController.text.isEmpty) {
      ShowSnakBar(
        context,
        content: 'Commercial license number cannot be empty',
        title: 'Failure',
        backGroundColor: const Color.fromARGB(255, 98, 22, 18),
      );
      return false;
    }
    if (passwordController.text.isEmpty) {
      ShowSnakBar(
        context,
        content: 'Password cannot be empty',
        title: 'Failure',
        backGroundColor: const Color.fromARGB(255, 98, 22, 18),
      );
      return false;
    }
    if (confirmPasswordController.text.isEmpty) {
      ShowSnakBar(
        context,
        content: 'Please confirm your password',
        title: 'Failure',
        backGroundColor: const Color.fromARGB(255, 98, 22, 18),
      );
      return false;
    } else if (confirmPasswordController.text != passwordController.text) {
      ShowSnakBar(
        context,
        content: 'Passwords do not match',
        title: 'Failure',
        backGroundColor: const Color.fromARGB(255, 98, 22, 18),
      );
      return false;
    }
    if (numberController.text.isEmpty) {
      ShowSnakBar(
        context,
        content: 'Phone number cannot be empty',
        title: 'Failure',
        backGroundColor: const Color.fromARGB(255, 98, 22, 18),
      );
      return false;
    }
    if (whatsappNumberController.text.isEmpty) {
      ShowSnakBar(
        context,
        content: 'WhatsApp number cannot be empty',
        title: 'Failure',
        backGroundColor: const Color.fromARGB(255, 98, 22, 18),
      );
      return false;
    }
    if (selectedSpecialties == null) {
      ShowSnakBar(
        context,
        content: 'Please select a service specialty',
        title: 'Failure',
        backGroundColor: const Color.fromARGB(255, 98, 22, 18),
      );
      return false;
    }
    if (selectedDays.isEmpty) {
      ShowSnakBar(
        context,
        content: 'Please select work days',
        title: 'Failure',
        backGroundColor: const Color.fromARGB(255, 98, 22, 18),
      );
      return false;
    }
    if (startTime == null || endTime == null) {
      ShowSnakBar(
        context,
        content: 'Please select working hours',
        title: 'Failure',
        backGroundColor: const Color.fromARGB(255, 98, 22, 18),
      );
      return false;
    }
    if (latitude == null || longitude == null) {
      ShowSnakBar(
        context,
        content: 'Please select your location on map',
        title: 'Failure',
        backGroundColor: const Color.fromARGB(255, 98, 22, 18),
      );
      return false;
    }
    if (_pdfFile == null) {
      ShowSnakBar(
        context,
        content: 'Please upload a document',
        title: 'Failure',
        backGroundColor: const Color.fromARGB(255, 98, 22, 18),
      );
      return false;
    }

    return true;
  }

  createAccount() async {
    // Gather all user inputs
    String tradeName = tradeNameController.text;
    String commercialLicenseNumber = commercialLicenseNumberController.text;
    String password = passwordController.text;
    String number = numberController.text;
    String whatsappNumber = whatsappNumberController.text;
    String description = descriptionController.text; // New field

    // Additional data
    String profileImagePath =
        _image!.path; // Assuming a profile image is required
    String pdfFilePath = _pdfFile!.path; // Assuming a document file is required

    // Gather all other selected data
    String specialty = selectedSpecialties!;
    String selectedServices = selectedServiceSpecialty.join(',');

    String workDays = selectedDays.join(', ');
    String startTimeFormatted =
        startTime != null ? _formatTime(startTime!) : '';
    String endTimeFormatted = endTime != null ? _formatTime(endTime!) : '';
    double latitudeValue = latitude!;
    double longitudeValue = longitude!;

    // Now, you can send this data to your backend or perform any necessary actions
    // For demonstration purposes, we'll just print the gathered data
    print('Trade Name: $tradeName');
    print('Commercial License Number: $commercialLicenseNumber');
    print('Password: $password');
    print('Number: $number');
    print('WhatsApp Number: $whatsappNumber');
    print('Description: $description'); // New field
    print('Profile Image Path: $profileImagePath');
    print('PDF File Path: $pdfFilePath');
    print('Specialty: $selectedSpecialties');
    print('Work Days: $workDays');
    print('Start Time: $startTimeFormatted');
    print('End Time: $endTimeFormatted');
    print('Latitude: $latitudeValue');
    print('Longitude: $longitudeValue');
    await context.read<ProviderServiceAuthCubit>().addProviderService(
          providerAccount: ServiceProviderAccountModel(
              tradeName: tradeName,
              commercialLicenseNumber: commercialLicenseNumber,
              password: password,
              number: number,
              whatssApp: whatsappNumber,
              descreption: description,
              image: _image,
              pdfFile: _pdfFile,
              specialtyName: selectedSpecialties,
              selectedSpecialties: selectedServices,
              selectedDays: workDays,
              startTime: startTimeFormatted,
              endTime: endTimeFormatted,
              latitude: latitudeValue,
              longitude: longitudeValue,
              mowaterDiscount: mowaterDiscount),
        );
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
        } else {
          _pdfFile = File(result.files.single.path!);
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
                'Save',
                style: TextStyles.text_16.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
