import 'dart:convert';

import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timesheet/controller/auth_controller.dart';
import 'package:timesheet/controller/ccdc_controller.dart';
import 'package:timesheet/controller/scan_qr_controller.dart';
import 'package:timesheet/data/repository/ccdc_repo.dart';
import 'package:timesheet/data/repository/splash_repo.dart';
import '../controller/localization_controller.dart';
import '../controller/splash_controller.dart';
import '../data/api/api_client.dart';
import '../data/model/language_model.dart';
import '../data/repository/auth_repo.dart';
import '../data/repository/language_repo.dart';
import '../theme/theme_controller.dart';
import '../utils/app_constants.dart';

Future<Map<String, Map<String, String>>> init() async {
  // Core
  final sharedPreferences = await SharedPreferences.getInstance();
  final firstCamera = await availableCameras();

  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => firstCamera);
  Get.lazyPut(() => ApiClient(
      appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));

  // Repository
  Get.lazyPut(() => LanguageRepo());
  Get.lazyPut(
      () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

  Get.lazyPut(
          () => SplashRepo(apiClient: Get.find()));
  Get.lazyPut(() => CCDCRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  // Controller
  Get.lazyPut(() => ThemeController(sharedPreferences: Get.find()));
  Get.lazyPut(() => LocalizationController(sharedPreferences: Get.find()));
  Get.lazyPut(() => SplashController(repo: Get.find()));
  Get.lazyPut(() => AuthController(repo: Get.find()));
  Get.lazyPut(() => CCDCController(repo: Get.find()));
  Get.lazyPut(() => QrController());

  if (await Permission.location.isGranted) {
    final newLocalData = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    Get.lazyPut(() => newLocalData);
  }

  // Retrieving localized data
  Map<String, Map<String, String>> _languages = Map();
  for (LanguageModel languageModel in AppConstants.languages) {
    String jsonStringValues = await rootBundle
        .loadString('assets/language/${languageModel.languageCode}.json');
    Map<String, dynamic> _mappedJson = json.decode(jsonStringValues);
    Map<String, String> _json = Map();
    _mappedJson.forEach((key, value) {
      _json[key] = value.toString();
    });
    _languages['${languageModel.languageCode}_${languageModel.countryCode}'] =
        _json;
  }
  return _languages;
}
