// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import 'package:Mowater/Features/forgetPassword/presntation/resetPassword/reset_passwor_cubit.dart';
// import 'package:Mowater/core/constants/color.dart';
// import 'package:Mowater/core/constants/size.dart';
// import 'package:Mowater/core/helper/validator.dart';
// import 'package:Mowater/core/routing/routing_name.dart';
// import 'package:Mowater/core/style/text_style.dart';
// import 'package:Mowater/core/widgets/animation_loading_button.dart';
// import 'package:Mowater/core/widgets/snak_bar.dart';
// import 'package:Mowater/core/widgets/text_form_fiedl.dart';

// class ForgetPasswordScreen extends StatefulWidget {
//   const ForgetPasswordScreen({super.key});

//   @override
//   State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
// }

// class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
//   TextEditingController emailController = TextEditingController();

//   GlobalKey<FormState> formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//             onPressed: () {
//               context.pop();
//             },
//             icon: const Icon(Icons.arrow_back_ios)),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.dg),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Forgot password?'.tr(),
//               style:
//                   TextStyles.text_30.copyWith(color: ColorApp.primeryColorDark),
//             ),
//             verticalSpace(13.h),
//             Text(
//               'Don’t worry! It happens. Please enter the email associated with your account.'
//                   .tr(),
//               style: TextStyles.text_16,
//             ),
//             verticalSpace(38.h),
//             Text(
//               "Email address".tr(),
//               style: TextStyles.text_14.copyWith(fontWeight: FontWeight.w500),
//             ),
//             Form(
//               key: formKey,
//               child: CustomTextFormField(
//                 controller: emailController,
//                 hintText: 'Enter your email address'.tr(),
//                 validator: (email) {
//                   return emailValidator(email);
//                 },
//               ),
//             ),
//             verticalSpace(20.h),
//             Center(
//               child: LoadingButton(
//                   isLoading: context.read<ResetPassworCubit>().isLoading,
//                   onPressed: () async {
//                     if (formKey.currentState!.validate()) {
//                       setState(() {});
//                       await context
//                           .read<ResetPassworCubit>()
//                           .sendresetPasswordCode(emailController.text);
//                       setState(() {});
//                     }
//                   },
//                   buttonText: 'Send code'.tr()),
//             ),
//             BlocBuilder<ResetPassworCubit, ResetPassworState>(
//               builder: (context, state) {
//                 return state.when(
//                   initial: () {
//                     return const SizedBox();
//                   },
//                   success: (message) {
//                     Future(() =>
//                         context.push(RouteName.verifyResetPasswordCode, extra: {
//                           'email': emailController.text,
//                         }));
//                     return const SizedBox();
//                   },
//                   failure: (message) {
//                     Future(() => ShowSnakBar(
//                           context,
//                           title: 'Failure'.tr(),
//                           iconData: Icons.info_outline_rounded,
//                           messageTextStyle: TextStyles.text_16
//                               .copyWith(fontWeight: FontWeight.bold),
//                           content: message,
//                           subtitleTextStyle: TextStyles.text_16,
//                           backGroundColor: Theme.of(context).colorScheme.secondary,
//                         ));
//                     return const SizedBox();
//                   },
//                   loading: () => const SizedBox(),
//                 );
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
