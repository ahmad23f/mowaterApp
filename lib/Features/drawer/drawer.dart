import 'package:Mowater/Features/drawer/widgets/normalCompany/normal_company_profile_widget.dart';
import 'package:Mowater/core/services/user_state.dart';
import 'package:Mowater/core/theming/cubit/theme_event_cubit.dart';
import 'package:Mowater/core/theming/cubit/theme_event_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:Mowater/main.dart';
import '../../Features/drawer/widgets/logout.dart';
import '../../Features/drawer/widgets/my_divider.dart';
import '../../Features/drawer/widgets/user_profile.dart';
import 'package:Mowater/main.dart';

class DrawerSlide extends StatelessWidget {
  const DrawerSlide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(UserServices.getUserInformation().type);
    return SafeArea(
      child: Drawer(
        child: BlocBuilder<ThemeCubit, ThemeEventState>(
          builder: (context, themeState) {
            return BlocBuilder<LanguageCubit, Locale>(
              builder: (context, languageState) {
                return ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    UserServices.getUserInformation().type == '1'
                        ? UserProfileWidget()
                        : NormalCompanyProfile(),
                    _buildSwitchTile(
                      context,
                      firstText: 'Light'.tr(),
                      secondText: 'Dark'.tr(),
                      icon: themeState.when(
                        themeChanged: (_) => Icons.light_mode_outlined,
                        initial: () => Icons.dark_mode_outlined,
                      ),
                      isOn: Theme.of(context).brightness == Brightness.dark,
                      onChanged: (bool value) {
                        context.read<ThemeCubit>().toggleTheme();
                        Navigator.pop(context);
                      },
                    ),
                    const MyDivider(),
                    _buildSwitchTile(
                      context,
                      firstText: 'English'.tr(),
                      secondText: 'Arabic'.tr(),
                      icon: Icons.language,
                      isOn: languageState == const Locale('ar', 'AE'),
                      onChanged: (bool value) {
                        context.read<LanguageCubit>().toggleLanguage(context);
                        Navigator.pop(context);
                      },
                    ),
                    const MyDivider(),
                    _buildListTile(
                      context,
                      title: 'Support'.tr(),
                      icon: Icons.contact_support_outlined,
                      route: '/user_profile',
                    ),
                    const MyDivider(),
                    _buildListTile(
                      context,
                      title: 'Terms & Conditions'.tr(),
                      icon: Icons.description_outlined,
                      route: '/user_profile',
                    ),
                    const MyDivider(),
                    _buildListTile(
                      context,
                      title: 'Privacy Policy'.tr(),
                      icon: Icons.privacy_tip_outlined,
                      route: '/user_profile',
                    ),
                    const MyDivider(),
                    _buildListTile(
                      context,
                      title: 'Contact US'.tr(),
                      icon: Icons.perm_contact_cal_outlined,
                      route: '/company_profile',
                    ),
                    const MyDivider(),
                    _buildListTile(
                      context,
                      title: 'About US'.tr(),
                      icon: Icons.info,
                      route: '/parking_number_car',
                    ),
                    const MyDivider(),
                    _buildListTile(
                      context,
                      title: 'About US'.tr(),
                      icon: Icons.info,
                      route: '/parking_number_car',
                    ),
                    const MyDivider(),
                    const LogoutButton(),
                    const MyDivider(),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildSwitchTile(BuildContext context,
      {required String firstText,
      required String secondText,
      required IconData icon,
      required bool isOn,
      required ValueChanged<bool> onChanged}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 30.w,
        ),
        Icon(icon),
        const SizedBox(width: 8),
        Text(
          firstText,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Switch(
          value: isOn,
          onChanged: onChanged,
          activeColor: const Color(0xffD70015), // Set active color to red
          activeTrackColor: Colors.grey,
          inactiveThumbColor: const Color(0xffD70015),
          inactiveTrackColor: Colors.grey, // Set inactive track color to gray
        ),
        const SizedBox(width: 8),
        Text(
          secondText,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildListTile(BuildContext context,
      {required String title, required IconData icon, required String route}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
          GoRouter.of(context).go(route);
        },
        child: Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 30.w,
              ),
              Icon(icon),
              const SizedBox(width: 8), // Add spacing between icon and text
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
