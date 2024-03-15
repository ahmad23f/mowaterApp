import 'package:Mowater/core/di/dependency_injection.dart';
import 'package:Mowater/core/routing/routing.dart';
import 'package:Mowater/core/theme/theming/theme_service.dart';
import 'package:Mowater/core/theming/cubit/theme_event_cubit.dart';
import 'package:Mowater/core/theming/cubit/theme_event_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await setupServices();

  await initializeDateFormatting('en-US');
  await initializeDateFormatting('ar-SA');

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('ar', 'AE')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ThemeCubit>(
              create: (context) => ThemeCubit(LanguageCubit())),
          BlocProvider<LanguageCubit>(
            create: (context) => LanguageCubit(),
          ),
        ],
        child: const Mowater(),
      ),
    ),
  );
}

class Mowater extends StatelessWidget {
  const Mowater({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 876),
      child: Builder(
        builder: (context) {
          return const _Mowater();
        },
      ),
    );
  }
}

class _Mowater extends StatelessWidget {
  const _Mowater({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeEventState>(
      builder: (context, state) {
        return MaterialApp.router(
          theme: state.when(
              themeChanged: (theme) => theme,
              initial: () =>
                  ThemeService.getThemeMode() == false ? lightMode : darkMode),
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          routerConfig: RoutingApp.router,
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            return BlocListener<ThemeCubit, ThemeEventState>(
              // Use the prefix for ThemeCubit and ThemeEventState
              listener: (context, state) {},
              child: Scaffold(
                body: child,
              ),
            );
          },
        );
      },
    );
  }
}
