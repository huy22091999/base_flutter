import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:timesheet/screen/home/home_screen.dart';
import 'package:timesheet/screen/list_inventory_screen/list_inventory_screen.dart';
import 'package:timesheet/screen/sign_in_screen.dart';

import '../screen/scan_asset/info_asset_screen.dart';
import '../screen/splash_screen.dart';

class RouteHelper {
  static const String initial = '/';
  static const String splash = '/splash';
  static const String language = '/language';
  static const String onBoarding1 = '/on-boarding-1';
  static const String onBoarding2 = '/on-boarding-2';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String verification = '/verification';
  static const String accessLocation = '/access-location';
  static const String pickMap = '/pick-map';
  static const String interest = '/interest';
  static const String main = '/main';
  static const String forgotPassword = '/forgot-password';
  static const String resetPassword = '/reset-password';
  static const String search = '/search';
  static const String store = '/store';
  static const String orderDetails = '/order-details';
  static const String profile = '/profile';
  static const String updateProfile = '/update-profile';
  static const String coupon = '/coupon';
  static const String notification = '/notification';
  static const String navbar = '/navbar';
  static const String assetInfo = '/asset-info';
  static const String listInventory = '/list-inventory';

  static String getInitialRoute() => '$initial';

  static String getSplashRoute() => '$splash';

  static String getLanguageRoute(String page) => '$language?page=$page';

  static String getSignInRoute() => '$signIn';

  static String getSignUpRoute() => '$signUp';

  static String getAccessInfo(String code) => '$assetInfo?code=$code';

  static String getListInventory(String id) => '$listInventory?id=$id';

  static List<GetPage> routes = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: signIn, page: () => const SignInScreen()),
    GetPage(name: main, page: () => const HomeScreent()),
    GetPage(
        name: assetInfo,
        page: () => InfoAssetScreen(code: Get.parameters['code']!)),
    GetPage(
        name: listInventory,
        page: () => ListInventoryScreen(id: Get.parameters['id']!)),
  ];

  static getRoute(Widget navigateTo) {
    // int _minimumVersion = 0;
    // if (GetPlatform.isAndroid) {
    //   _minimumVersion =
    //       Get.find<SplashController>().configModel.appMinimumVersionAndroid;
    // } else if (GetPlatform.isIOS) {
    //   _minimumVersion =
    //       Get.find<SplashController>().configModel.appMinimumVersionIos;
    // }
    // return AppConstants.APP_VERSION < _minimumVersion
    //     ? UpdateScreen(isUpdate: true)
    //     : Get.find<SplashController>().configModel.maintenanceMode
    //         ? UpdateScreen(isUpdate: false)
    //         : Get.find<LocationController>().getUserAddress() == null
    //             ? AccessLocationScreen(
    //                 fromSignUp: false, fromHome: false, route: Get.currentRoute)
    //             :


    navigateTo;
  }
}
