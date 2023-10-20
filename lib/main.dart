import 'dart:developer';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:base_clean_bloc/common/constants.dart';
import 'package:base_clean_bloc/common/notification/index.dart';
import 'package:base_clean_bloc/di/di_setup.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common/config/screen_utils_config.dart';
import 'routes/app_router.dart';

String envConfig(String flavor) {
  switch (flavor) {
    case 'dev':
      return 'assets/env/.env_dev';
    case 'staging':
      return 'assets/env/.env_staging';
    case 'production':
      return 'assets/env/.env_production';
    default:
      return 'assets/env/.env_dev';
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const flavor = String.fromEnvironment('flavor', defaultValue: 'dev');
  log("flavor: $flavor");
  await dotenv.load(
    fileName: envConfig(flavor),
  );
  await EasyLocalization.ensureInitialized();
  configureDependencies();
  await Firebase.initializeApp();
  await getIt<PushNotificationHelper>().initialize();
  await getIt<LocalNotificationHelper>().init();
  runApp(
    DevicePreview(
      enabled: false, // !kReleaseMode,
      builder: (context) {
        return EasyLocalization(
          supportedLocales: const [LocalizationConstants.enUSLocale, LocalizationConstants.viLocale],
          path: LocalizationConstants.path,
          fallbackLocale: LocalizationConstants.enUSLocale,
          child: MyApp(),
        );
      },
    ),
  );
}

//todo: Navigator
//todo: base bloc, base widget, etc

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRoute = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        ScreenUtilsConfig.designWidth,
        ScreenUtilsConfig.designHeight,
      ),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return AdaptiveTheme(
            light: ThemeData.light(),
            dark: ThemeData.dark(),
            initial: AdaptiveThemeMode.light,
            builder: (theme, darkTheme) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                theme: theme,
                darkTheme: darkTheme,
                routerConfig: _appRoute.config(),
              );
            });
      },
    );
  }
}
