import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timesheet/controller/patient_controller.dart';
import 'package:timesheet/screen/pantient/widget/item_patient.dart';

import '../../utils/color_resources.dart';

class PatientScreen extends StatefulWidget {
  const PatientScreen({super.key});

  @override
  State<PatientScreen> createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  var selectedValue = "Đang điều trị".obs;

  @override
  void initState() {
    super.initState();
    Get.find<PatientController>().getPatients(29);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Danh sách bệnh nhân',style: GoogleFonts.nunitoSans(fontSize: 18,fontWeight: FontWeight.w700,color: Colors.black),),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        toolbarHeight: 80,
        leadingWidth: 80,
        leading: InkWell(
          onTap: (){Navigator.pop(context);},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade300)
              ),
              child: const Icon(Icons.arrow_back_rounded,color: Colors.black,),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  cursorColor: ColorResources.getPrimaryColor(),
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFEEF6FC),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16,vertical: 14),
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
                      hintText: "Tìm kiếm bệnh nhân",
                      hintStyle: GoogleFonts.nunitoSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF8AA0BC)
                      )),
                ),
                const SizedBox(height: 10,),
                Obx(() => SizedBox(
                  width: MediaQuery.of(context).size.width - 32,
                  child: Row(
                    children: [
                      Expanded(child: RadioListTile(
                        title: const Text('Đang điều trị'),
                        value: "Đang điều trị",
                        groupValue: selectedValue.value,
                        onChanged: (s) {selectedValue.value = s.toString();},
                        activeColor: ColorResources.getPrimaryColor(),
                        visualDensity: const VisualDensity(horizontal: -4),
                      ),),
                      Expanded(child: RadioListTile(
                        title: const Text('Xem tất cả'),
                        value: "Xem tất cả",
                        groupValue: selectedValue.value,
                        onChanged: (s) {selectedValue.value = s.toString();},
                        activeColor: ColorResources.getPrimaryColor(),
                        visualDensity: const VisualDensity(horizontal: -4),
                      ),),
                    ],
                  ),
                )),
               GetBuilder<PatientController>(builder: (ctrl) =>  ListView.builder(
                   itemCount: ctrl.listPatient.length,
                   shrinkWrap: true,
                   controller: ScrollController(),
                   itemBuilder: (context,index) => ItemPatient(patient: ctrl.listPatient[index],)
               ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
