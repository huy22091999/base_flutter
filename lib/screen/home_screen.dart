import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:timesheet/screen/invetory/inventory_screen.dart';
import 'package:timesheet/screen/scan_qr_screen.dart';
import 'package:timesheet/utils/color_resources.dart';
import '../controller/auth_controller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:animate_do/animate_do.dart';

class HomeScreent extends StatefulWidget {
  const HomeScreent({Key? key}) : super(key: key);

  @override
  State<HomeScreent> createState() => _HomeScreentState();
}

class _HomeScreentState extends State<HomeScreent> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> list = ['Thông báo 1','Thông báo 2','Thông báo 3'];
  FToast fToast = FToast();

  @override
  void initState() {
    super.initState();
    fToast.init(context);
    // Get.find<AuthController>().getUser();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        key: _scaffoldKey,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/image/avatar.jpg'),
                        ),
                        Container(
                            margin: const EdgeInsets.only(left: 8.0),
                            child: RichText(
                              text: TextSpan(children: [
                                const TextSpan(
                                    text: 'Xin chào,',
                                    style: TextStyle(color: Colors.black)),
                                TextSpan(
                                    text: '\nNguyễn Giản Tuấn',
                                    style: TextStyle(
                                        color: ColorResources.getMainColor(),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0))
                              ]),
                            )),
                      ],
                    ),
                    Container(),
                    GestureDetector(
                      onTap: (){
                        Get.to(() => const QRScannerPage());
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorResources.getMainColor()),
                          child: ColorFiltered(
                            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                            child: Lottie.asset(
                                'assets/animationFile/qr_scan_animation.json',
                                fit: BoxFit.contain,
                                height: 48,
                                width: 48),
                          )),
                    )
                  ],
                ),
                const SizedBox(height: 20,),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (context, int index) => FadeInUp(
                    duration: const Duration(milliseconds: 800),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        color: Colors.grey.shade200
                      ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(list[index]),
                        )
                    ),
                  ),
                ),
                SizedBox(height: height*0.12,),
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => const InventoryScreen(),
                                transition: Transition.rightToLeftWithFade,
                                curve: Curves.easeInOut);
                          },
                          child: FadeInLeft(
                            duration: const Duration(milliseconds: 800),
                            delay: const Duration(milliseconds: 200),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                color: ColorResources.getPrimaryColor(),
                              ),
                              height: height*0.18,
                              child: const Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Spacer(),
                                    Icon(Icons.inventory_2_outlined,color: Colors.white,size: 50,),
                                    Spacer(),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text("Kiểm kê",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                    ),
                                  ],
                                ),
                              ),
                    ),
                          ),
                        )),
                    const SizedBox(width: 10,),
                    Flexible(
                        flex: 1,
                        child: FadeInUp(
                          duration: const Duration(milliseconds: 800),
                          delay: const Duration(milliseconds: 200),
                          child: Container(
                            height: height*0.18,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              color: ColorResources.getPrimaryColor(),
                            ),
                          ),
                        )),
                    const SizedBox(width: 10,),
                    Flexible(
                        flex: 1,
                        child: GestureDetector(
                          onTap: showToast,
                          child: FadeInRight(
                            duration: const Duration(milliseconds: 800),
                            delay: const Duration(milliseconds: 200),
                            child: Container(
                              height: height*0.18,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                color: ColorResources.getPrimaryColor(),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Spacer(),
                                    Icon(Icons.note_alt_outlined,color: Colors.white,size: 50,),
                                    Spacer(),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text("Ghi chú",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )),
                  ],
                )
              ],
            ),
          ),
        ));
  }

  void getUser() {
    Get.find<AuthController>().getUser().then((value) => {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("$value")))
        });
  }
  void showToast(){
    fToast.showToast(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 0.2,
              blurRadius: 5,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
          color: Colors.green,
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0,vertical: 12),
          child: Text('Quét mã thành công',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w600),),
        ),
      ),
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(milliseconds: 1500),
    );
  }
}
