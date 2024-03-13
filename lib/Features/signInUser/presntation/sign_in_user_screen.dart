import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:mowaterApp/Features/signInUser/presntation/cubit/sign_in_user_cubit.dart';
import 'package:mowaterApp/Features/signUp/presentation/sign_up_screen.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/constants/size.dart';
import 'package:mowaterApp/core/helper/validator.dart';
import 'package:mowaterApp/core/routing/routing_name.dart';
import 'package:mowaterApp/core/services/user_model.dart';
import 'package:mowaterApp/core/services/user_state.dart';
import 'package:mowaterApp/core/style/text_style.dart';
import 'package:mowaterApp/core/widgets/animation_loading_button.dart';
import 'package:mowaterApp/core/widgets/snak_bar.dart';
import 'package:mowaterApp/core/widgets/text_form_fiedl.dart';

class SignInUserScreen extends StatefulWidget {
  const SignInUserScreen({Key? key}) : super(key: key);

  @override
  _SignInUserScreenState createState() => _SignInUserScreenState();
}

class _SignInUserScreenState extends State<SignInUserScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _rememberMe = false; // Initialize to false initially
  final bool _showForm = false;
  late User _selectedUser;
  List<User> _savedUsers = [];

  @override
  void initState() {
    super.initState();
    _loadSavedUserData(); // Load saved user data when the screen initializes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pushReplacement(RouteName.loginUserScreen);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(100.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome Back!',
                    style: TextStyles.text_30
                        .copyWith(color: ColorApp.primeryColorDark),
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email Address",
                          style: TextStyles.text_14
                              .copyWith(fontWeight: FontWeight.normal),
                        ),
                        CustomTextFormField(
                          controller: _emailController,
                          hintText: 'E-Mail',
                          validator: (p0) {
                            return emailValidator(p0);
                          },
                        ),
                        verticalSpace(20.h),
                        Text(
                          "Password",
                          style: TextStyles.text_14.copyWith(
                              fontWeight: FontWeight.normal, height: 0.4),
                        ),
                        CustomTextFormField(
                          isPasswordField: true,
                          controller: _passwordController,
                          hintText: 'Password',
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                context.push(RouteName.forgetPassword);
                              },
                              child: Text(
                                'Forgot password?',
                                style: TextStyles.text_14
                                    .copyWith(color: ColorApp.primeryColorDark),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(20.h),
                  Center(
                    child: LoadingButton(
                      isLoading: context.read<SignInUserCubit>().isLoading,
                      onPressed: () async {
                        setState(() {});
                        if (formKey.currentState!.validate()) {
                          await context.read<SignInUserCubit>().singIn(
                              email: _emailController.text,
                              password: _passwordController.text);
                          setState(() {});
                        }
                      },
                      buttonText: 'Login',
                    ),
                  ),
                  BlocBuilder<SignInUserCubit, SignInUserState>(
                    builder: (context, state) {
                      return state.when(
                        initial: () {
                          return const SizedBox();
                        },
                        success: (user) {
                          UserServices.saveLoginState(
                            user.user,
                          );
                          Future(() => context.push(RouteName.home));

                          return const SizedBox();
                        },
                        failure: (errorMessage) {
                          Future(() => ShowSnakBar(
                                context,
                                title: 'Failure',
                                iconData: Icons.info_outline_rounded,
                                messageTextStyle: TextStyles.text_16
                                    .copyWith(fontWeight: FontWeight.bold),
                                content: errorMessage,
                                subtitleTextStyle: TextStyles.text_16,
                                backGroundColor: ColorApp.secunderyColorDark,
                              ));
                          return const SizedBox();
                        },
                        loading: () {
                          return const SizedBox();
                        },
                      );
                    },
                  )
                ],
              ),
              verticalSpace(12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Dont't have an account? ",
                    style: TextStyles.text_14
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                  InkWell(
                    onTap: () {
                      context.pushReplacement(RouteName.loginUserScreen);
                    },
                    child: Text(
                      "Sign up",
                      style: TextStyles.text_14
                          .copyWith(color: ColorApp.primeryColorDark),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Expanded(
                    child: Divider(
                      indent: 20,
                      endIndent: 20,
                    ),
                  ),
                  InkWell(child: Text("Or")),
                  Expanded(
                    child: Divider(
                      endIndent: 20,
                      indent: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GoogleSignInButton(),
                  SizedBox(width: 20),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _loadSavedUserData() async {
    final userBox = await Hive.openBox<User>('myAccounts');
    if (userBox.isNotEmpty) {
      setState(() {
        _savedUsers = userBox.values.toList();
        _selectedUser = _savedUsers[0]; // Select the first user by default
        _rememberMe = true; // Set to true if there's a saved user
        _emailController.text = _selectedUser.username ?? '';
        _passwordController.text = _selectedUser.password ?? '';
      });
    }
  }
}
