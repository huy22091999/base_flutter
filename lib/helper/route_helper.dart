import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:timesheet/screen/main_screen.dart';
import 'package:timesheet/screen/auth/sign_in_screen.dart';
import 'package:timesheet/screen/pantient/patient_screen.dart';
import 'package:timesheet/screen/treatment_screen/treatment_screen.dart';
import '../screen/auth/splash_screen.dart';

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
  static const String patient = '/patient';
  static const String treatment = '/treatment';

  static String getInitialRoute() => '$initial';

  static String getSplashRoute() => '$splash';

  static String getLanguageRoute(String page) => '$language?page=$page';

  static String getOnBoarding1Route() => '$onBoarding1';

  static String getOnBoarding2Route() => '$onBoarding2';

  static String getSignInRoute() => '$signIn';

  static String getSignUpRoute() => '$signUp';

  static String getVerificationRoute(
      String number, String token, String page, String pass) {
    return '$verification?page=$page&number=$number&token=$token&pass=$pass';
  }

  static String getAccessLocationRoute(String page) =>
      '$accessLocation?page=$page';

  static String getPickMapRoute(String page, bool canRoute) =>
      '$pickMap?page=$page&route=${canRoute.toString()}';

  static String getInterestRoute() => '$interest';

  static String getMainRoute() => '$main';

  static String getResetPasswordRoute(
          String phone, String token, String page) =>
      '$resetPassword?phone=$phone&token=$token&page=$page';

  static String getSearchRoute({required String queryText}) =>
      '$search?query=${queryText ?? ''}';

  static String getStoreRoute(int id, String page) =>
      '$store?id=$id&page=$page';

  static String getOrderDetailsRoute(int orderID) {
    return '$orderDetails?id=$orderID';
  }

  static String getProfileRoute() => '$profile';

  static String getUpdateProfileRoute() => '$updateProfile';

  static String getCouponRoute() => '$coupon';

  static String getNotificationRoute() => '$notification';

  static List<GetPage> routes = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: signIn, page: () => const SignInScreen()),
    GetPage(name: main, page: () => const MainScreen()),
    GetPage(name: patient, page: () => const PatientScreen()),
    GetPage(name: treatment, page: () => const TreatmentScreen()),
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
