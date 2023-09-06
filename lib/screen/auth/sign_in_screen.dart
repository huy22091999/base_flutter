import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timesheet/controller/auth_controller.dart';
import 'package:timesheet/screen/main_screen.dart';
import 'package:timesheet/utils/color_resources.dart';
import 'package:timesheet/utils/images.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../view/custom_snackbar.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _userFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final _showPass = false.obs;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Stack(
          children: [
            Scrollbar(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(height: 80,),
                      GetBuilder<AuthController>(
                        builder: (controller) => Opacity(
                          opacity: controller.loading ? 0.3 : 1,
                          child: Container(
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.fromLTRB(100, 0, 100, 60),
                                  color: Colors.white,
                                  child: Image.asset(Images.logo,color: ColorResources.getPrimaryColor(),height: 120,width: 90,),
                                ),
                                Container(
                                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        "Đăng nhập",
                                        style: GoogleFonts.nunitoSans(
                                          color: ColorResources.getPrimaryColor(),
                                          fontSize: 32,
                                          fontWeight: FontWeight.w700
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 20),
                                        child: TextFormField(
                                          controller: _usernameController,
                                          focusNode: _userFocus,
                                          cursorColor: ColorResources.getPrimaryColor(),
                                          textInputAction: TextInputAction.next,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: const Color(0xFFF9FAFB),
                                            contentPadding: const EdgeInsets.symmetric(horizontal: 16,vertical: 18),
                                            prefixIcon: const Icon(Icons.person_2_outlined, color:  Color(0xFF7383A3),size: 26,),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      width: 1,
                                                      color: Color(0xFFE5E7EB)),
                                                  borderRadius: BorderRadius.circular(15),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1.5,
                                                    color: ColorResources.getPrimaryColor()),
                                                borderRadius: BorderRadius.circular(15),
                                              ),
                                              hintText: "Tên đăng nhập",
                                              hintStyle: GoogleFonts.nunitoSans(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: ColorResources.getPrimaryTextColor()
                                              )),
                                        ),
                                      ),
                                      Container(
                                          margin: const EdgeInsets.only(top: 20),
                                          child: Obx(
                                                () => TextFormField(
                                                  textInputAction: TextInputAction.done,
                                                  cursorColor: ColorResources.getPrimaryColor(),
                                                  obscureText: !_showPass.value,
                                                  focusNode: _passwordFocus,
                                                  controller: _passwordController,
                                                  decoration: InputDecoration(
                                                      filled: true,
                                                      fillColor: const Color(0xFFF9FAFB),
                                                      contentPadding: const EdgeInsets.symmetric(horizontal: 16,vertical: 18),
                                                      prefixIcon: Icon(Icons.lock_outline,color: ColorResources.getPrimaryTextColor(),size: 26,),
                                                      suffixIcon: IconButton(
                                                    onPressed: () {
                                                      _showPass.value = !_showPass.value;
                                                    },
                                                    icon: Icon(_showPass.value
                                                        ? Icons.visibility_outlined
                                                        : Icons.visibility_off_outlined,color: ColorResources.getPrimaryTextColor(),),
                                                  ),
                                                  enabledBorder: OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                        width: 1,
                                                        color: Color(0xFFE5E7EB)),
                                                    borderRadius: BorderRadius.circular(15),
                                                  ),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            width: 1.5,
                                                            color: ColorResources.getPrimaryColor()),
                                                        borderRadius: BorderRadius.circular(15),
                                                      ),
                                                  hintText: "Mật khẩu",
                                                      hintStyle: GoogleFonts.nunitoSans(
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.w400,
                                                          color: ColorResources.getPrimaryTextColor()
                                                      )),
                                            ),
                                          )),
                                      const SizedBox(height: 10,),
                                      Text('Quên mật khẩu',textAlign: TextAlign.end,style: GoogleFonts.nunitoSans(
                                        color: ColorResources.getPrimaryColor(),fontSize: 14
                                      ),),
                                      Container(
                                        margin: const EdgeInsets.only(top: 60),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            _login();
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: ColorResources.getPrimaryColor(),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10)),
                                          ),
                                          child: Container(
                                            padding:
                                            const EdgeInsets.fromLTRB(40, 18, 40, 18),
                                            child: Text("Đăng nhập",
                                                style: GoogleFonts.nunitoSans(
                                                  fontSize: 16,
                                                  color: Colors.white,fontWeight: FontWeight.w600
                                                )),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
            ),
            Center(
              child: GetBuilder<AuthController>(
                builder: (controller) {
                  return Visibility(
                    visible: controller.loading,
                    child: CircularProgressIndicator(color: ColorResources.getPrimaryColor(),),
                  );
                },
              )
            )
          ],
        ));
  }

  _login() {
    _userFocus.unfocus();
    _passwordFocus.unfocus();
    FocusScope.of(context).unfocus();
    String username = _usernameController.text;
    String password = _passwordController.text;
    if (username.isEmpty || password.isEmpty) {
      const snackBar = SnackBar(
        content: Text('Bạn cần điền đầy đủ tài khoản mật khẩu.'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      Get.find<AuthController>().login(username, password).then((value) => {
            if (value == 0)
              {Get.off(const MainScreen(),transition: Transition.fade,duration: const Duration(milliseconds: 500),curve: Curves.easeIn)}
            else
              {
                showCustomSnackBar('Đăng nhập không thành công !'),
              }
          });
    }
  }
}
