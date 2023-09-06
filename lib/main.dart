import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:timesheet/theme/dark_theme.dart';
import 'package:timesheet/theme/light_theme.dart';
import 'package:timesheet/theme/theme_controller.dart';
import 'package:timesheet/utils/app_constants.dart';
import 'package:timesheet/utils/messages.dart';
import 'package:url_strategy/url_strategy.dart';
import 'controller/localization_controller.dart';
import 'firebase_options.dart';
import 'helper/get_di.dart' as di;
import 'helper/responsive_helper.dart';
import 'helper/route_helper.dart';

Future<void> main() async {
  if (kDebugMode) {
    print("Bắt đầu: ${DateTime.now()}");
  }
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  if (ResponsiveHelper.isMobilePhone()) {
    HttpOverrides.global = MyHttpOverrides();
  }

  setPathUrlStrategy();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Map<String, Map<String, String>> _languages = await di.init();

  runApp(MyApp(languages: _languages));
}

class MyApp extends StatelessWidget {
  final Map<String, Map<String, String>>? languages;
  const MyApp({super.key, this.languages});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(builder: (themeController) {
      return GetBuilder<LocalizationController>(builder: (localizeController) {
        FlutterNativeSplash.remove();
        print("Kết thúc init: ${DateTime.now()}");
        return GetMaterialApp(
          title: AppConstants.APP_NAME,
          debugShowCheckedModeBanner: false,
          navigatorKey: Get.key,
          scrollBehavior: const MaterialScrollBehavior().copyWith(
            dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
          ),
          theme: themeController.darkTheme!
              ? themeController.darkColor == null
                  ? dark()
                  : dark(color: themeController.darkColor!)
              : themeController.lightColor == null
                  ? light()
                  : light(color: themeController.lightColor!),
          locale: localizeController.locale,
          translations: Messages(languages: languages),
          fallbackLocale: Locale(AppConstants.languages[0].languageCode,
              AppConstants.languages[0].countryCode),
          initialRoute: GetPlatform.isWeb
              ? RouteHelper.getInitialRoute()
              : RouteHelper.getSplashRoute(),
          getPages: RouteHelper.routes,
          defaultTransition: Transition.topLevel,
          transitionDuration: const Duration(milliseconds: 250),
        );
      });
    });
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
