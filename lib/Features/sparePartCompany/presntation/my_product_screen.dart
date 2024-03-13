// import 'dart:io';
// import 'dart:typed_data';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:mowaterApp/Features/CareForSaleBrand/presentation/cubit/carModelsBrand/car_models_brands_cubit.dart';
// import 'package:mowaterApp/Features/CarsForSale/data/model/carModelProduct/car_model_product.dart';
// import 'package:mowaterApp/Features/CarsForSale/data/model/car_model.dart';
// import 'package:mowaterApp/Features/SellYourCar/presentation/cylinders_dropdown.dart';
// import 'package:mowaterApp/Features/SellYourCar/presentation/widgets/formWidget/call_form.dart';
// import 'package:mowaterApp/Features/SellYourCar/presentation/widgets/formWidget/car_model_dropdown.dart';
// import 'package:mowaterApp/Features/SellYourCar/presentation/widgets/formWidget/car_name_dropdown.dart';
// import 'package:mowaterApp/Features/SellYourCar/presentation/widgets/formWidget/colors_list.dart';
// import 'package:mowaterApp/Features/SellYourCar/presentation/widgets/formWidget/condition_dropdown.dart';
// import 'package:mowaterApp/Features/SellYourCar/presentation/widgets/formWidget/doors_dropdown.dart';
// import 'package:mowaterApp/Features/SellYourCar/presentation/widgets/formWidget/extra_text_form.dart';
// import 'package:mowaterApp/Features/SellYourCar/presentation/widgets/formWidget/fuel_type_dropdown.dart';
// import 'package:mowaterApp/Features/SellYourCar/presentation/widgets/formWidget/gear_box_drodown.dart';
// import 'package:mowaterApp/Features/SellYourCar/presentation/widgets/formWidget/kilometer_text_form.dart';
// import 'package:mowaterApp/Features/SellYourCar/presentation/widgets/formWidget/location_dropdown.dart';
// import 'package:mowaterApp/Features/SellYourCar/presentation/widgets/formWidget/price_form_filed.dart';
// import 'package:mowaterApp/Features/SellYourCar/presentation/widgets/formWidget/specifications_dropdown.dart';
// import 'package:mowaterApp/Features/SellYourCar/presentation/widgets/formWidget/warranty_dropdown.dart';
// import 'package:mowaterApp/Features/SellYourCar/presentation/widgets/formWidget/whatsapp_form.dart';
// import 'package:mowaterApp/Features/SellYourCar/presentation/widgets/formWidget/years_dropdown.dart';
// import 'package:mowaterApp/Features/carNumbers/presntation/sell_your_plate_screen.dart';
// import 'package:mowaterApp/Features/mowaterMart/data/model/mowater_mart_product_model.dart';
// import 'package:mowaterApp/Features/showRoomMyCars/presntation/addEdit/show_room_add_edit_cubit.dart';
// import 'package:mowaterApp/Features/sparePartCompany/presntation/addProduct/add_spare_parts_product_cubit.dart';
// import 'package:mowaterApp/Features/sparePartCompany/presntation/add_product_screen.dart';
// import 'package:mowaterApp/core/constants/color.dart';
// import 'package:mowaterApp/core/constants/size.dart';
// import 'package:mowaterApp/core/di/dependency_injection.dart';
// import 'package:mowaterApp/core/networking/api_constant.dart';
// import 'package:mowaterApp/core/services/user_state.dart';
// import 'package:mowaterApp/core/style/text_style.dart';
// import 'package:mowaterApp/core/widgets/button.dart';
// import 'package:mowaterApp/test_add_car.dart';
// import 'package:multiple_images_picker/multiple_images_picker.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';

// class ShowRoomMyCarsAddEditScreen extends StatefulWidget {
//   final CarProduct? carModelProduct;

//   const ShowRoomMyCarsAddEditScreen({Key? key, required this.carModelProduct})
//       : super(key: key);

//   @override
//   _ShowRoomMyCarsAddEditScreenState createState() =>
//       _ShowRoomMyCarsAddEditScreenState();
// }

// class _ShowRoomMyCarsAddEditScreenState
//     extends State<ShowRoomMyCarsAddEditScreen> {
//   final TextEditingController carNameController = TextEditingController();

//   int carMake = 0;
//   int carModel = 0;

//   int year = 2000;
//   String specifications = '';
//   String location = '';

//   TextEditingController extraInfo = TextEditingController();
//   TextEditingController price = TextEditingController();
//   TextEditingController whatsappNumber = TextEditingController();
//   TextEditingController phoneNumber = TextEditingController();
//   String selectedImages = '';

//   @override
//   void initState() {
//     super.initState();
//     initializeFields();
//   }

//   void initializeFields() {
//     carNameController.text = widget.carModelProduct?.carMake ?? '';
//     year = widget.carModelProduct?.year ?? 2020;
//     specifications = widget.carModelProduct?.specifications ?? '';
//     location = widget.carModelProduct?.location ?? '';
//     extraInfo.text = widget.carModelProduct?.extraInfo ?? '';
//     price.text = widget.carModelProduct?.price.toString() ?? '';
//     whatsappNumber.text =
//         widget.carModelProduct?.whatsappNumber.toString() ?? '';
//     phoneNumber.text = widget.carModelProduct?.callNumber.toString() ?? '';
//   }

//   @override
//   Widget build(BuildContext mcontext) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Edit Car',
//           style: TextStyles.text_16,
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(mainPadding),
//         child: MultiBlocProvider(
//           providers: [
//             BlocProvider(
//               create: (context) => getIt<CarModelsBrandsCubit>(),
//             ),
//             BlocProvider(
//               create: (context) => getIt<ShowRoomAddEditCubit>(),
//             ),
//           ],
//           child: Column(
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   color: ColorApp.secunderyColorDark.withOpacity(1),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 height: 230.h,
//                 width: mediasize(mcontext).width,
//                 child: IconButton(
//                   onPressed: () async {
//                     await pickImages();
//                   },
//                   icon: const Icon(Icons.add),
//                 ),
//               ),
//               verticalSpace(20),
//               selectedImages.isEmpty
//                   ? const SizedBox(
//                       child: Text('No Image Yet!'),
//                     )
//                   : SizedBox(
//                       height: 100.h,
//                       child: buildSelectedImagesGrid(),
//                     ),
//               verticalSpace(20),
//               CarNameDropDownWidget(
//                 carNameController: carNameController,
//                 onChanged: (value) {
//                   carMake = value!;
//                 },
//               ),
//               verticalSpace(20),
//               CarModelDropDown(
//                 onChanged: (value) {
//                   carModel = value!;
//                 },
//               ),
//               verticalSpace(20),
//               YearDropdown(
//                 initialValue: year,
//                 onChanged: (value) {
//                   year = value;
//                 },
//               ),
//               verticalSpace(30),
//               SpecificationsDropdown(
//                 onChanged: (value) {
//                   specifications = value!;
//                 },
//               ),
//               verticalSpace(30),
//               LocationDropDown(
//                 onChanged: (value) {
//                   location = value!;
//                 },
//               ),
//               verticalSpace(30),
//               ExtraTextForm(
//                 textEditingController: extraInfo,
//               ),
//               verticalSpace(30),
//               CallPhoneNumber(textEditingController: phoneNumber),
//               verticalSpace(30),
//               WhatsaapForm(textEditingController: whatsappNumber),
//               verticalSpace(30),
//               PriceFormField(
//                 price: price,
//                 onChanged: (p0) {
//                   price.text = p0;
//                 },
//               ),
//               verticalSpace(30),
//               CustomButton(
//                 onPressed: () async {
//                   if (validateFields()) {
//                     context.read<AddSparePartsProductCubit>().addProduct(
//                           MowaterMartProductModel(
//                             phoneNumber: int.parse(phoneNumber.text),
//                             id: UserServices.getUserInformation().id!,
//                             carType: carMake.toString(),
//                             carModel: carModel.toString(),
//                             prodectDate: year.toString(),
//                             location: location,
//                             prodectPrice: price.text,
//                             prodectImag: selectedImages,
//                             whatsAppNumber: int.parse(whatsappNumber.text),
//                             publisherId: UserServices.getUserInformation().id,
//                             isAds: 0,
//                             carStatus: 
//                           ),
//                         );
//                   }
//                 },
//                 color: ColorApp.primeryColorDark,
//                 padding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 10),
//                 textStyle: TextStyles.text_24.copyWith(color: Colors.white),
//                 text: 'Send',
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildSelectedImagesGrid() {
//     return ListView.builder(
//       scrollDirection: Axis.horizontal,
//       itemCount: selectedImages.length,
//       itemBuilder: (context, index) {
//         final imageFile = selectedImages;
//         return Stack(
//           children: [
//             Container(
//               margin: const EdgeInsets.only(right: 8),
//               width: 100,
//               height: 100,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//                 image: DecorationImage(
//                   image: FileImage(imageFile),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Positioned(
//               top: 4,
//               right: 4,
//               child: GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     selectedImages.removeAt(index);
//                   });
//                 },
//                 child: Container(
//                   padding: const EdgeInsets.all(4),
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.black.withOpacity(0.5),
//                   ),
//                   child: const Icon(
//                     Icons.close,
//                     color: Colors.white,
//                     size: 18,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   bool validateFields() {
//     if (carMake == 0) {
//       showSnackBar('Please select car make');
//       return false;
//     }
//     if (carModel == 0) {
//       showSnackBar('Please select car model');
//       return false;
//     }
//     // Add validation for other fields similarly
//     return true;
//   }

//   void showSnackBar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(
//           message,
//           style: const TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.red,
//       ),
//     );
//   }

//   Future<void> pickImages() async {
//     List<File> images = [];

//     var status = await Permission.storage.status;
//     if (!status.isGranted) {
//       // Request permission only if it's not granted
//       status = await Permission.storage.request();
//       if (!status.isGranted) {
//         // If permission is still not granted, return
//         return;
//       }
//     }

//     List<Asset> resultList = [];
//     try {
//       resultList = await MultipleImagesPicker.pickImages(
//         maxImages: 5,
//         enableCamera: true,
//         cupertinoOptions: const CupertinoOptions(
//           takePhotoIcon: "chat",
//         ),
//         materialOptions: const MaterialOptions(
//           actionBarColor: "#abcdef",
//           actionBarTitle: "Pick images",
//           allViewTitle: "All photos",
//           useDetailsView: false,
//           selectCircleStrokeColor: "#000000",
//         ),
//       );
//     } on Exception catch (e) {
//       print(e);
//     }

//     for (var asset in resultList) {
//       final ByteData byteData = await asset.getByteData();
//       final bytes = byteData.buffer.asUint8List();
//       final tempFile =
//           File('${(await getTemporaryDirectory()).path}/${asset.name}');
//       await tempFile.writeAsBytes(bytes);
//       images.add(tempFile);

//       setState(() {
//         selectedImages.add(tempFile);
//       });
//     }
//   }
// }
