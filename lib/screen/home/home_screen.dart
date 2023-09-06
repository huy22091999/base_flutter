import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:timesheet/controller/auth_controller.dart';
import 'package:timesheet/screen/home/widget/item_activity.dart';
import 'package:timesheet/screen/home/widget/item_feature.dart';
import '../../data/model/body/activity.dart';
import '../../helper/route_helper.dart';
import '../../utils/color_resources.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart' as badges;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenSection0State();
}

class _HomeScreenSection0State extends State<HomeScreen> {
  final FocusNode _searchFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: GetBuilder<AuthController>(builder: (controller) => SingleChildScrollView(
            controller: ScrollController(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/image/waving_hand_icon.svg',
                              width: 20,
                              height: 20,
                            ),
                            const Text(
                              ' Xin chào!',
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Text("Bác sĩ ${controller.user.userName}",style: const TextStyle(fontWeight: FontWeight.w700,fontSize: 28),)
                      ],
                    ),
                    const Spacer(),
                    badges.Badge(
                      position: badges.BadgePosition.topEnd(top: 2, end: -4),
                      badgeStyle: const badges.BadgeStyle(
                        borderSide: BorderSide(color: Colors.white,width: 2,strokeAlign: 0),
                        elevation: 8
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network('https://zpsocial-f41-org.zadn.vn/a12ffd56adcc409219dd.jpg',width: 48,height: 48,fit: BoxFit.cover,),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 24,),
                TextFormField(
                  cursorColor: ColorResources.getPrimaryColor(),
                  textInputAction: TextInputAction.next,
                  focusNode: _searchFocus,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFEEF6FC),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16,vertical: 18),
                      prefixIcon: const Icon(Icons.search, color: Color(0xFF8AA0BC),size: 26,),
                      suffixIcon: const Icon(CupertinoIcons.slider_horizontal_3,color: Colors.black,),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Tìm kiếm",
                      hintStyle: GoogleFonts.nunitoSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF8AA0BC)
                      )),
                ),
                const SizedBox(height: 24,),
                Text('Tính năng',style: GoogleFonts.nunitoSans(
                  fontSize: 16,fontWeight: FontWeight.w700
                ),),
                const SizedBox(height: 16,),
                Row(
                  children: [
                    Expanded(child: ItemFeature(imgPath: 'assets/image/icon_doctor.svg',title: 'Điều dưỡng',colorBackground: const Color(0x261C6BA4),nextPage: nextPage,)),
                    const SizedBox(width: 16,),
                    Expanded(child: ItemFeature(imgPath: 'assets/image/icon_treatment.svg',title: 'Điều trị',colorBackground: const Color(
                        0x26229818),nextPage: nextPage,))
                  ],
                ),
                const SizedBox(height: 16,),
                Row(
                  children: [
                    Expanded(child: ItemFeature(imgPath: 'assets/image/icon_pacs.svg',title: 'PACS',colorBackground: const Color(
                        0x269d4c6c),nextPage: nextPage,)),
                    const SizedBox(width: 16,),
                    Expanded(child: ItemFeature(imgPath: 'assets/image/corona.svg',title: 'Ký số',colorBackground: const Color(
                        0x263E3EDF),nextPage: nextPage,))
                  ],
                ),
                const SizedBox(height: 16,),
                Row(
                  children: [
                    Expanded(child: ItemFeature(imgPath: 'assets/image/icon_noun_pill.svg',title: 'Chỉ định',colorBackground: const Color(
                        0x26E09F1F),nextPage: nextPage,)),
                    const SizedBox(width: 16,),
                    Expanded(child: ItemFeature(imgPath: 'assets/image/icon_note.svg',title: 'Ghi chú',colorBackground: const Color(
                        0x26009DC7),nextPage: nextPage))
                  ],
                ),
                const SizedBox(height: 24,),
                Text('Hoạt động sắp tới',style: GoogleFonts.nunitoSans(
                    fontSize: 16,fontWeight: FontWeight.w700
                ),),
                const SizedBox(height: 16,),
                SizedBox(
                  height: 116,
                  child: ListView.builder(
                    itemCount: list.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                      margin: EdgeInsets.only(right: index != list.length - 1 ? 10 : 0),
                      child: ItemActivity(
                        activity: list[index],
                      ),
                    ),
                  ),
                )
                  ],
            ),
          ),)
        ),
      ),
    );
  }
  List<Activity> list = [
    Activity(DateTime.now(), 'Dr. Mim Akhter', 'Depression',const Color(0xBF7B96C4),ColorResources.getPrimaryColor()),
    Activity(DateTime.now().add(16132546.seconds), 'Dr. Mim Akhter', 'Depression',const Color(
        0x99F1DDC7),const Color(0xC4E39556)),
  ];
  void nextPage(){
    _searchFocus.unfocus();
    FocusScope.of(context).unfocus();
    Get.toNamed(RouteHelper.patient);
  }
}
