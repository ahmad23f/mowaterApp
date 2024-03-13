import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/date_symbol_data_local.dart'; // Changed from date_symbol_data_file.dart
import 'package:mowaterApp/Features/Parking/models/plate_model.dart';
import 'package:mowaterApp/core/di/dependency_injection.dart';
import 'package:mowaterApp/core/routing/routing.dart';
import 'package:mowaterApp/core/services/company_model.dart';
import 'package:mowaterApp/core/services/user_model.dart';
import 'package:mowaterApp/core/services/user_type.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(UsersTypeAdapter());
  Hive.registerAdapter(NormalCompanyModelHiveAdapter());
  Hive.registerAdapter(PlateModelAdapter());

  await setupServices();

  await initializeDateFormatting('en-US');
  await initializeDateFormatting('ar-SA');
  runApp(
    EasyLocalization(
        startLocale: const Locale('ar-AE'),
        supportedLocales: const [Locale('en', 'US'), Locale('ar', 'AE')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en', 'US'),
        child: const MowaterApp()),
  );
}

class MowaterApp extends StatelessWidget {
  const MowaterApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 876),
      child: MaterialApp.router(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        routerConfig: RoutingApp.router,
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
