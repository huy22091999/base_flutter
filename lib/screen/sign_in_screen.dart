import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timesheet/controller/auth_controller.dart';
import 'package:timesheet/screen/home_screen.dart';
import 'package:timesheet/screen/scan_qr_screen.dart';
import 'package:animate_do/animate_do.dart';
import 'package:timesheet/utils/images.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
                      Container(height: 100,),
                      GetBuilder<AuthController>(
                        builder: (controller) => Opacity(
                          opacity: controller.loading ? 0.3 : 1,
                          child: Container(
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FadeInUp(
                                  duration: const Duration(milliseconds: 1000),
                                  child: Container(
                                    padding: const EdgeInsets.fromLTRB(100, 56, 100, 60),
                                    color: Colors.white,
                                    child: Image.asset(Images.logo),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                                  child: Column(
                                    children: [
                                      FadeInUp(
                                        duration: const Duration(milliseconds: 1000),
                                        child: const Text(
                                          "Login To Your Account",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 20),
                                        child: FadeInUp(
                                          duration: const Duration(milliseconds: 1000),
                                          child: TextFormField(
                                            controller: _usernameController,
                                            textInputAction: TextInputAction.next,
                                            decoration: InputDecoration(
                                                contentPadding:
                                                const EdgeInsets.only(left: 28),
                                                border: OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                        width: 1,
                                                        color:
                                                        Color.fromRGBO(244, 244, 244, 1)),
                                                    borderRadius: BorderRadius.circular(15)),
                                                hintText: "Email",
                                                hintStyle: const TextStyle(
                                                    color: Colors.grey)),
                                          ),
                                        ),
                                      ),
                                      Container(
                                          margin: const EdgeInsets.only(top: 20),
                                          child: Obx(
                                                () => FadeInUp(
                                                  duration: const Duration(milliseconds: 1000),
                                                  child: TextFormField(
                                                    textInputAction: TextInputAction.done,
                                                    obscureText: !_showPass.value,
                                                    controller: _passwordController,
                                                    decoration: InputDecoration(
                                                    contentPadding:
                                                    const EdgeInsets.only(left: 28),
                                                    suffixIcon: IconButton(
                                                      onPressed: () {
                                                        _showPass.value = !_showPass.value;
                                                      },
                                                      icon: Icon(_showPass.value
                                                          ? Icons.visibility
                                                          : Icons.visibility_off),
                                                    ),
                                                    border: OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                          width: 1,
                                                          color: Color.fromRGBO(
                                                              244, 244, 244, 1)),
                                                      borderRadius: BorderRadius.circular(15),
                                                    ),
                                                    hintText: "Password",
                                                    hintStyle: const TextStyle(
                                                        color:
                                                        Colors.grey)),
                                            ),
                                                ),
                                          )),
                                      Container(
                                        margin: const EdgeInsets.only(top: 40),
                                        child: FadeInUp(
                                          duration: const Duration(milliseconds: 1000),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              _login();
                                            },
                                            style: TextButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(15)),
                                            ),
                                            child: Container(
                                              padding:
                                              const EdgeInsets.fromLTRB(40, 18, 40, 18),
                                              child: const Text("Login",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Color.fromRGBO(
                                                          191, 252, 226, 1.0))),
                                            ),
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
                    child: const CircularProgressIndicator(),
                  );
                },
              )
            )
          ],
        ));
  }

  _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;
    FocusManager.instance.primaryFocus?.unfocus();
    if (username.isEmpty || password.isEmpty) {
      const snackBar = SnackBar(
        content: Text('Bạn cần điền đầy đủ tài khoản mật khẩu.'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      Get.find<AuthController>().login(username, password).then((value) => {
            if (value == 200)
              {Get.to(() => const HomeScreent(),transition: Transition.size,duration: const Duration(milliseconds: 500),curve: Curves.easeIn)}
            else if (value == 400)
              {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Tài khoản mật khẩu không chính xác")))
              }
            else
              {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Đã xảy ra lỗi xin vui lòng thử lại")))
              },
          });
    }
  }
}
