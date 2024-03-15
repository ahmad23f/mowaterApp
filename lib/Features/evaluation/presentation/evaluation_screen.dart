import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Mowater/Features/SellYourCar/presentation/widgets/formWidget/car_model_dropdown.dart';
import 'package:Mowater/Features/SellYourCar/presentation/widgets/formWidget/car_name_dropdown.dart';
import 'package:Mowater/Features/SellYourCar/presentation/widgets/formWidget/condition_dropdown.dart';
import 'package:Mowater/Features/SellYourCar/presentation/widgets/formWidget/extra_text_form.dart';
import 'package:Mowater/Features/SellYourCar/presentation/widgets/formWidget/kilometer_text_form.dart';
import 'package:Mowater/Features/SellYourCar/presentation/widgets/formWidget/specifications_dropdown.dart';
import 'package:Mowater/Features/SellYourCar/presentation/widgets/formWidget/warranty_dropdown.dart';
import 'package:Mowater/Features/SellYourCar/presentation/widgets/formWidget/years_dropdown.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/services/user_state.dart';
import 'package:Mowater/core/style/text_style.dart';
import 'package:Mowater/core/widgets/annymous_block.dart';
import 'package:Mowater/core/widgets/button.dart';
import 'package:multiple_images_picker/multiple_images_picker.dart';
import 'package:path_provider/path_provider.dart';

class EvaluationScreen extends StatefulWidget {
  const EvaluationScreen({Key? key}) : super(key: key);

  @override
  _EvaluationScreenState createState() => _EvaluationScreenState();
}

class _EvaluationScreenState extends State<EvaluationScreen> {
  final TextEditingController carNameController = TextEditingController();
  List<File> selectedImages = [];
  String carMake = '';
  String carModel = '';
  int year = 2000;
  String speclifcations = '';
  String condtion = '';

  int warranty = 0;
  String regionalSpec = '';
  TextEditingController kilometer = TextEditingController();
  TextEditingController extraInfo = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Evaluation',
              style: TextStyles.text_22,
            ),
          ),
          body: UserServices.getUserInformation().id != -1
              ? SingleChildScrollView(
                  child: Padding(
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
                                child: Text('No Image'),
                              )
                            : SizedBox(
                                height: 100.h,
                                child: buildSelectedImagesGrid(),
                              ),
                        verticalSpace(20),
                        CarNameDropDownWidget(
                          carNameController: carNameController,
                        ),
                        verticalSpace(20),
                        CarModelDropDown(
                          onChanged: (value) {
                            // carModel = value!;
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
                        WarrantyDropdown(
                          onChanged: (value) {
                            warranty = value == 'yes' ? 1 : 0;
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
                        CustomButton(
                          onPressed: () async {
                            // await TestAddNewCarRepository(getIt())
                            //     .addNewCar(selectedImages);
                          },
                          color: ColorApp.primeryColorDark,
                          padding: EdgeInsets.symmetric(
                              horizontal: 100.w, vertical: 10),
                          textStyle:
                              TextStyles.text_24.copyWith(color: Colors.white),
                          text: 'Send',
                        )
                      ],
                    ),
                  ),
                )
              : AnnymousNotAllowedWidget(
                  text: "You cannot rate your car without logging in")),
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

    List<Asset> resultList = [];
    try {
      resultList = await MultipleImagesPicker.pickImages(
        maxImages: 5, // Maximum number of images to pick
        enableCamera: true, // Allow the user to pick images from camera
        cupertinoOptions: const CupertinoOptions(
          takePhotoIcon: "chat", // Change the icon for taking photos
        ),
        materialOptions: const MaterialOptions(
          actionBarColor: "#abcdef", // Change the color of the action bar
          actionBarTitle: "Pick images", // Change the title of the action bar
          allViewTitle: "All photos", // Change the title of the all view
          useDetailsView:
              false, // Show or hide photo details (defaults to true)
          selectCircleStrokeColor:
              "#000000", // Change the color of the select circle
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
}
