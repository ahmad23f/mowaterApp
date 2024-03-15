import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Mowater/Features/CarsForSale/data/model/car_model.dart';
import 'package:Mowater/Features/SellYourCar/presentation/cylinders_dropdown.dart';
import 'package:Mowater/Features/SellYourCar/presentation/widgets/formWidget/call_form.dart';
import 'package:Mowater/Features/SellYourCar/presentation/widgets/formWidget/car_model_dropdown.dart';
import 'package:Mowater/Features/SellYourCar/presentation/widgets/formWidget/car_name_dropdown.dart';
import 'package:Mowater/Features/SellYourCar/presentation/widgets/formWidget/colors_list.dart';
import 'package:Mowater/Features/SellYourCar/presentation/widgets/formWidget/condition_dropdown.dart';
import 'package:Mowater/Features/SellYourCar/presentation/widgets/formWidget/doors_dropdown.dart';
import 'package:Mowater/Features/SellYourCar/presentation/widgets/formWidget/extra_text_form.dart';
import 'package:Mowater/Features/SellYourCar/presentation/widgets/formWidget/fuel_type_dropdown.dart';
import 'package:Mowater/Features/SellYourCar/presentation/widgets/formWidget/gear_box_drodown.dart';
import 'package:Mowater/Features/SellYourCar/presentation/widgets/formWidget/kilometer_text_form.dart';
import 'package:Mowater/Features/SellYourCar/presentation/widgets/formWidget/location_dropdown.dart';
import 'package:Mowater/Features/SellYourCar/presentation/widgets/formWidget/price_form_filed.dart';
import 'package:Mowater/Features/SellYourCar/presentation/widgets/formWidget/specifications_dropdown.dart';
import 'package:Mowater/Features/SellYourCar/presentation/widgets/formWidget/warranty_dropdown.dart';
import 'package:Mowater/Features/SellYourCar/presentation/widgets/formWidget/whatsapp_form.dart';
import 'package:Mowater/Features/SellYourCar/presentation/widgets/formWidget/years_dropdown.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/services/user_state.dart';
import 'package:Mowater/core/style/text_style.dart';
import 'package:Mowater/core/widgets/button.dart';
import 'package:Mowater/test_add_car.dart';
import 'package:multiple_images_picker/multiple_images_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class NewCarForm extends StatefulWidget {
  const NewCarForm({Key? key}) : super(key: key);

  @override
  _NewCarFormState createState() => _NewCarFormState();
}

class _NewCarFormState extends State<NewCarForm> {
  final TextEditingController carNameController = TextEditingController();
  List<File> selectedImages = [];
  int carMake = 0;
  int carModel = 0;

  int year = 2000;
  String cylinders = '';
  String speclifcations = '';
  String condtion = '';
  String location = '';
  String exteriorColor = 'red';
  String interiorColor = 'red';
  String gearBoxType = '';

  String fuelType = '';
  int warranty = 0;
  int doors = 0;
  TextEditingController kilometer = TextEditingController();
  TextEditingController extraInfo = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController whatssApp = TextEditingController();
  TextEditingController callNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(mainPadding),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: ColorApp.primeryColorDark.withOpacity(0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            height: 230.h,
            width: mediasize(context).width,
            child: IconButton(
              onPressed: () async {
                await pickImages();
              },
              icon: const Icon(Icons.add),
            ),
          ),
          verticalSpace(20),
          selectedImages.isEmpty
              ? const SizedBox(
                  child: Text('No Image Yet!'),
                )
              : SizedBox(
                  height: 100.h,
                  child: buildSelectedImagesGrid(),
                ),
          verticalSpace(20),
          CarNameDropDownWidget(
            carNameController: carNameController,
            onChanged: (p0) {
              carMake = p0!;
            },
          ),
          verticalSpace(20),
          CarModelDropDown(
            onChanged: (value) {
              carModel = value!;
            },
          ),
          verticalSpace(20),
          YearDropdown(
            initialValue: DateTime.now().year,
            onChanged: (value) {
              year = value;
            },
          ),
          verticalSpace(30),
          CylindersDropdown(
            onChanged: (value) {
              cylinders = value!;
            },
          ),
          verticalSpace(30),
          SpecificationsDropdown(
            onChanged: (value) {
              speclifcations = value!;
            },
          ),
          verticalSpace(30),
          ConditionDropDown(
            onChanged: (value) {
              condtion = value!;
            },
          ),
          verticalSpace(30),
          LocationDropDown(
            onChanged: (value) {
              location = value!;
            },
          ),
          verticalSpace(30),
          ColorDropdown(
            isInteriorColor: false,
            onChanged: (value) {
              exteriorColor = value!;
            },
          ),
          verticalSpace(30),
          ColorDropdown(
            isInteriorColor: true,
            onChanged: (value) {
              interiorColor = value!;
            },
          ),
          verticalSpace(30),
          GearBoxDropdown(
            onChanged: (value) {
              gearBoxType = value!;
            },
          ),
          verticalSpace(30),
          FuelTypeDropdown(
            onChanged: (value) {
              fuelType = value!;
            },
          ),
          verticalSpace(30),
          WarrantyDropdown(
            onChanged: (value) {
              warranty = value == 'yes' ? 1 : 0;
            },
          ),
          verticalSpace(30),
          DoorsDropDown(
            onChanged: (value) {
              doors = value!;
            },
          ),
          verticalSpace(30),
          KiloMetersTextForm(
            textEditingController: kilometer,
          ),
          verticalSpace(30),
          ExtraTextForm(
            textEditingController: extraInfo,
          ),
          verticalSpace(30),
          CallPhoneNumber(textEditingController: callNumber),
          verticalSpace(30),
          WhatsaapForm(textEditingController: whatssApp),
          verticalSpace(30),
          PriceFormField(
            price: price,
            onChanged: (p0) {
              price.text = p0;
            },
          ),
          verticalSpace(30),
          CustomButton(
            onPressed: () async {
              print(UserServices.getUserInformation().id);

              if (_checkFormFields()) {
                await addCar().addCarme(
                  Car(
                    createdAt: DateTime.now(),
                    id: UserServices.getUserInformation().id!,
                    carMake: carMake.toString(),
                    carModel: carModel.toString(),
                    year: year,
                    cylinders: int.tryParse(cylinders) ?? 4,
                    specifications: speclifcations,
                    condition: condtion,
                    location: location,
                    exteriorColor: exteriorColor,
                    interiorColor: interiorColor,
                    gearBox: gearBoxType,
                    fuelType: fuelType,
                    warranty: warranty,
                    doors: doors,
                    kilometer: kilometer.text,
                    price: int.parse(price.text),
                    imagesId: 0,
                    whatsappNumber: int.tryParse(whatssApp.text) ?? 0,
                    phoneNumber: int.tryParse(callNumber.text)!,
                    userId: 0,
                    isAprove: 0,
                    isAds: 0,
                  ),
                  selectedImages,
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('All fields are required.'),
                  ),
                );
              }
            },
            color: ColorApp.primeryColorDark,
            padding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 10),
            textStyle: TextStyles.text_24.copyWith(color: Colors.white),
            text: 'Send',
          )
        ],
      ),
    );
  }

  Widget DateTimeTextField(TextEditingController controller, String label) {
    return CupertinoTextField(
      controller: controller,
      placeholder: label,
      padding: const EdgeInsets.all(12.0),
      keyboardType: TextInputType.datetime,
      decoration: BoxDecoration(
        border: Border.all(color: CupertinoColors.systemGrey, width: 1.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      onChanged: (value) {},
    );
  }

  Future<void> pickImages() async {
    List<File> images = [];

    var status = await Permission.storage.status;
    if (!status.isGranted) {
      // Request permission only if it's not granted
      status = await Permission.storage.request();
      if (!status.isGranted) {
        // If permission is still not granted, return
        return;
      }
    }

    List<Asset> resultList = [];
    try {
      resultList = await MultipleImagesPicker.pickImages(
        maxImages: 5,
        enableCamera: true,
        cupertinoOptions: const CupertinoOptions(
          takePhotoIcon: "chat",
        ),
        materialOptions: const MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Pick images",
          allViewTitle: "All photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      print(e);
    }

    for (var asset in resultList) {
      final ByteData byteData = await asset.getByteData();
      final bytes = byteData.buffer.asUint8List();
      final tempFile =
          File('${(await getTemporaryDirectory()).path}/${asset.name}');
      await tempFile.writeAsBytes(bytes);
      images.add(tempFile);

      setState(() {
        selectedImages.add(tempFile);
      });
    }
  }

  Widget buildSelectedImagesGrid() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: selectedImages.length,
      itemBuilder: (context, index) {
        final imageFile = selectedImages[index];
        return Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 8),
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: FileImage(imageFile),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 4,
              right: 4,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedImages.removeAt(index);
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .color!
                        .withOpacity(0.5),
                  ),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  bool _checkFormFields() {
    if (carMake == 0 ||
        cylinders.isEmpty ||
        speclifcations.isEmpty ||
        condtion.isEmpty ||
        location.isEmpty ||
        exteriorColor.isEmpty ||
        interiorColor.isEmpty ||
        gearBoxType.isEmpty ||
        fuelType.isEmpty ||
        doors == 0 ||
        price.text.isEmpty ||
        kilometer.text.isEmpty ||
        whatssApp.text.isEmpty ||
        callNumber.text.isEmpty) {
      return false;
    }
    return true;
  }
}
