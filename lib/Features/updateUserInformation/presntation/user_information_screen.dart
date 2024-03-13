import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mowaterApp/Features/updateUserInformation/presntation/widgets/add_basic_info_form_user.dart';
import 'package:mowaterApp/Features/updateUserInformation/presntation/widgets/edite_profile_form.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/networking/api_constant.dart';
import 'package:mowaterApp/core/services/user_model.dart';
import 'package:mowaterApp/core/services/user_state.dart';

class UserInformationScreen extends StatefulWidget {
  bool? isEditMode = false;

  UserInformationScreen({Key? key, this.isEditMode}) : super(key: key);

  @override
  _UserInformationScreenState createState() => _UserInformationScreenState();
}

class _UserInformationScreenState extends State<UserInformationScreen> {
  late TextEditingController nameController;
  late TextEditingController nickName;
  late User user;
  File? _image;

  @override
  void initState() {
    super.initState();
    user = UserServices.getUserInformation();
    nameController = TextEditingController();
    nickName = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: const Text(
            'User Information',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          leading: widget.isEditMode == true
              ? IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                  ),
                  onPressed: () {
                    context.pop();
                  },
                )
              : const SizedBox()),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: _selectImage,
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
                        : user.image != null && user.image!.isNotEmpty
                            ? ClipOval(
                                child: Image.network(
                                  "${ApiConstans.userImage}${user.image!}",
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
                                      Icons.person,
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
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color:
                                                  ColorApp.secunderyColorDark,
                                            ),
                                            child: const Icon(
                                              Icons.add,
                                              size: 20,
                                            )),
                                      ))
                                ],
                              ),
                  ),
                )),
            SizedBox(height: 20.h), // Add spacing
            widget.isEditMode == true
                ? EditProfileForm(
                    image: _image,
                  )
                : AddBasicInfoFormUser(
                    image: _image,
                    fullNameController: nameController,
                    nickNamecontroller: nickName),

            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  // Function to select image
  Future<void> _selectImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }
}
