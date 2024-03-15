import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Mowater/Features/SellYourCar/presentation/widgets/formWidget/call_form.dart';
import 'package:Mowater/Features/SellYourCar/presentation/widgets/formWidget/car_model_dropdown.dart';
import 'package:Mowater/Features/SellYourCar/presentation/widgets/formWidget/car_name_dropdown.dart';
import 'package:Mowater/Features/SellYourCar/presentation/widgets/formWidget/price_form_filed.dart';
import 'package:Mowater/Features/SellYourCar/presentation/widgets/formWidget/whatsapp_form.dart';
import 'package:Mowater/Features/SellYourCar/presentation/widgets/formWidget/years_dropdown.dart';
import 'package:Mowater/Features/insurance/categorys/requestAquate/model/car_insurance_model.dart';
import 'package:Mowater/Features/insurance/categorys/requestAquate/persntation/addCar/add_new_car_insurance_cubit.dart';
import 'package:Mowater/Features/insurance/categorys/requestAquate/persntation/widgets/email_form.dart';
import 'package:Mowater/Features/insurance/categorys/requestAquate/persntation/widgets/insurance_typ_drop_down.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/services/user_state.dart';
import 'package:Mowater/core/style/text_style.dart';
import 'package:Mowater/core/widgets/button.dart';
import 'package:Mowater/core/widgets/form_field_.dart';
import 'package:Mowater/core/widgets/snak_bar.dart';
import 'package:intl/intl.dart';

class RequestAquateScreen extends StatefulWidget {
  const RequestAquateScreen({Key? key}) : super(key: key);

  @override
  _RequestAquateScreenState createState() => _RequestAquateScreenState();
}

class _RequestAquateScreenState extends State<RequestAquateScreen> {
  final TextEditingController carNameController = TextEditingController();
  int carMake = 0;
  int carModel = 0;
  int year = 2000;
  String insuranceType = '';
  TextEditingController emailController = TextEditingController();
  TextEditingController callNumberController = TextEditingController();
  TextEditingController whatsAppController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController nameController =
      TextEditingController(text: UserServices.getUserInformation().name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Request A Quote",
          style: TextStyles.text_20,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(mainPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            verticalSpace(20),
            CarNameDropDownWidget(
              carNameController: carNameController,
              onChanged: (value) {
                setState(() {
                  carMake = value!;
                });
              },
            ),
            verticalSpace(20),
            CarModelDropDown(
              onChanged: (value) {
                setState(() {
                  carModel = value!;
                });
              },
            ),
            verticalSpace(20),
            YearDropdown(
              initialValue: DateTime.now().year,
              onChanged: (value) {
                setState(() {
                  year = value;
                });
              },
            ),
            verticalSpace(30),
            InsuranceTypeDropDown(
              onChanged: (value) {
                setState(() {
                  insuranceType = value!;
                });
              },
            ),
            verticalSpace(30),
            EmailFormWidget(
              textEditingController: emailController,
            ),
            verticalSpace(30),
            CallPhoneNumber(textEditingController: callNumberController),
            verticalSpace(30),
            WhatsaapForm(textEditingController: whatsAppController),
            verticalSpace(30),
            DateField(
              controller: birthdayController,
              label: 'Birthday',
            ),
            verticalSpace(30),
            CustomFormFieldWitheBorder(
                textEditingController: nameController,
                label: 'Name',
                iconData: Icons.person_2_outlined),
            verticalSpace(30),
            PriceFormField(
              price: priceController,
              onChanged: (value) {
                setState(() {
                  priceController.text = value;
                });
              },
            ),
            verticalSpace(30),
            CustomButton(
              onPressed: () async {
                if (_checkFormFields()) {
                  context.read<AddNewCarInsuranceCubit>().addCar(
                        CarInsuranceModel(
                          carMake: carMake,
                          carModel: carModel,
                          carYear: DateTime(year),
                          carPrice: priceController.text,
                          type: insuranceType,
                          phoneNumber: callNumberController.text,
                          whatsAppNumber: whatsAppController.text,
                          userName: nameController.text,
                          birthday: DateTime.parse(birthdayController.text),
                          email: emailController.text,
                          userId: UserServices.getUserInformation().id!,
                          dateRequest: DateTime.now(),
                        ),
                        context,
                      );
                  clearFields();
                } else {
                  List<String> emptyFields = _getEmptyFields();
                  ShowSnakBar(
                    context,
                    title: 'Failure',
                    iconData: Icons.info_outline_rounded,
                    messageTextStyle: TextStyles.text_16
                        .copyWith(fontWeight: FontWeight.bold),
                    content: _buildEmptyFieldsMessage(emptyFields),
                    subtitleTextStyle: TextStyles.text_16,
                    backGroundColor: Theme.of(context).colorScheme.secondary,
                  );
                }
              },
              color: ColorApp.primeryColorDark,
              padding: EdgeInsets.symmetric(
                horizontal: 100.w,
                vertical: 10,
              ),
              textStyle: TextStyles.text_24.copyWith(color: Colors.white),
              text: 'Send',
            )
          ],
        ),
      ),
    );
  }

  List<String> _getEmptyFields() {
    List<String> emptyFields = [];
    if (carMake == 0) emptyFields.add('Car Make');
    if (carModel == 0) emptyFields.add('Car Model');
    if (insuranceType.isEmpty) emptyFields.add('Insurance Type');
    if (emailController.text.isEmpty) emptyFields.add('Email');
    if (callNumberController.text.isEmpty) emptyFields.add('Call Number');
    if (whatsAppController.text.isEmpty) emptyFields.add('WhatsApp Number');
    if (priceController.text.isEmpty) emptyFields.add('Price');
    if (birthdayController.text.isEmpty) emptyFields.add('Birthday');
    return emptyFields;
  }

  String _buildEmptyFieldsMessage(List<String> emptyFields) {
    return 'Empty fields: ${emptyFields.join(', ')}';
  }

  bool _checkFormFields() {
    return _getEmptyFields().isEmpty;
  }

  clearFields() {
    carMake = 0;
    carModel = 0;
    insuranceType = '';
    emailController.clear();
    callNumberController.clear();
    whatsAppController.clear();
    priceController.clear();
    birthdayController.clear();
  }
}

class DateField extends StatefulWidget {
  final TextEditingController controller;
  final String label;

  const DateField({
    Key? key,
    required this.controller,
    required this.label,
  }) : super(key: key);

  @override
  _DateFieldState createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showDatePicker(context);
      },
      child: AbsorbPointer(
        child: TextFormField(
          controller: widget.controller,
          style: TextStyles.text_16.copyWith(color: Colors.white),
          decoration: InputDecoration(
              label: Text(
                'Birthday',
                style: TextStyles.text_16,
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      BorderSide(color: ColorApp.primeryColorDark, width: 1.0)),
              prefixIcon: const Icon(
                Icons.calendar_month_outlined,
              ),
              contentPadding: const EdgeInsets.all(0),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                      color: ColorApp.primeryColorDark, width: 1.0))),
          onChanged: (value) {},
        ),
      ),
    );
  }

  Future<void> _showDatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        widget.controller.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }
}
