import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timesheet/screen/note/note_screen.dart';
import 'package:timesheet/screen/notification/notitfication_screen.dart';
import 'package:timesheet/screen/patient_record/outpatient_screen.dart';
import 'package:timesheet/screen/setting/setting_screen.dart';
import 'package:timesheet/utils/color_resources.dart';
import '../controller/auth_controller.dart';
import '../helper/route_helper.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:timesheet/screen/home/home_screen.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MainScreen> {
  List<Widget> listScreen = [
    const HomeScreen(),
    const OutPatientScreen(),
    const NotificationScreen(),
    const SettingScreen(),
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var index = 0.obs;
  var title = "home".obs;

  @override
  void initState() {
    super.initState();
    Get.find<AuthController>().getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      key: _scaffoldKey,
      body: listScreen[index.value],
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        selectedIconTheme: IconThemeData(color: ColorResources.getPrimaryColor()),
        selectedItemColor: ColorResources.getPrimaryColor(),
        unselectedIconTheme: const IconThemeData(color: Colors.grey),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: index.value,
        type: BottomNavigationBarType.fixed,
        iconSize: 26,
        selectedFontSize: 13,
        unselectedFontSize: 13,
        onTap: (i){index.value = i;},
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled,),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.event_note,),label: "Ghi chú"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications,),label: "Thông báo"),
          BottomNavigationBarItem(icon: Icon(Icons.settings,),label: "Cài đặt"),
        ],
      )),
    ));
  }

  void logOut() {
    Get.find<AuthController>().logOut().then((value) =>
    {
      if(value == 200){
        Get.offNamed(RouteHelper.signIn)
      }
      else
        {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Đã có lỗi xảy ra vui lòng thử lại")))
        }
    });
  }

  void getUser() {
    Get.find<AuthController>().getCurrentUser().then((value) =>
    {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("$value")))
    });
  }

  void changePage(String s) {
    navigator?.pop(context);
    title.value = s.tr;
    switch (s) {
      case "home":
        index.value = 0;
      case "Cấp phát CCDC":
        {
          index.value = 1;
        }
    }
    var _currentIndex = 0;
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: _currentIndex == 0
            ? const HomeScreen()
            : _currentIndex == 1
            ? const HomeScreen()
            : const HomeScreen(),
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [

            /// Home
            SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text("Home"),
              selectedColor: Colors.purple,
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: const Icon(Icons.favorite_border),
              title: const Text("Likes"),
              selectedColor: Colors.pink,
            ),

            /// Search
            SalomonBottomBarItem(
              icon: const Icon(Icons.search),
              title: const Text("Search"),
              selectedColor: Colors.orange,
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: const Icon(Icons.person),
              title: const Text("Profile"),
              selectedColor: Colors.teal,
            ),
          ],
        ),
      );
    }
  }
}
