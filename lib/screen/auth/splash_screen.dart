import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timesheet/controller/auth_controller.dart';
import 'package:timesheet/screen/auth/sign_in_screen.dart';
import 'package:timesheet/screen/home/home_screen.dart';
import 'package:timesheet/screen/main_screen.dart';
import 'package:timesheet/utils/color_resources.dart';
import '../../controller/splash_controller.dart';
import '../../helper/route_helper.dart';
import '../../utils/dimensions.dart';
import '../../utils/images.dart';
import '../../view/no_internet_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Get.find<SplashController>().getHospitalName();
    Timer(1.5.seconds, () {_route(); });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashController>(builder: (splashController) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: ColorResources.getPrimaryColor(),
          child: Center(
            child: splashController.hasConnection
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(Images.logo, width: 200),
                      const SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                      // Text(AppConstants.APP_NAME, style: robotoMedium.copyWith(fontSize: 25)),
                    ],
                  )
                : NoInternetScreen(child: const SplashScreen()),
          ),
        );
      }),
    );
  }

  _route() {
    Get.find<AuthController>().getCurrentUser().then((value) => {
          if (value == 0)
            {
              Get.off(() => const SplashScreen(),
                  transition: Transition.native,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn)
            }
          else
            {Get.offNamed(RouteHelper.signIn)}
        });
  }
}
