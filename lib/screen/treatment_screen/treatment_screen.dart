import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timesheet/controller/patient_controller.dart';
import 'package:timesheet/screen/treatment_screen/widget/infomation_patient.dart';
import 'package:timesheet/utils/color_resources.dart';
import '../../data/model/body/medical_record.dart';
import '../medical_report/medical_report_screen.dart';

class TreatmentScreen extends StatefulWidget {
  const TreatmentScreen({super.key});

  @override
  State<TreatmentScreen> createState() => _TreatmentScreenState();
}

class _TreatmentScreenState extends State<TreatmentScreen> {
  int medicalRecordId = Get.arguments;
  List<String> list = ['Bệnh án','Ghi chú','Tờ điều trị','Chỉ định DVKT','Kê đơn','Công nợ','PACS'];
  @override
  void initState() {
    super.initState();
    Get.find<PatientController>().getMedicalRecord(medicalRecordId);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: GetBuilder<PatientController>(builder: (controller){
            return Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: size.height*0.184,
                      color: ColorResources.getPrimaryColor(),
                      child: Column(
                        children: [
                          const SizedBox(height: 10,),
                          ListTile(
                            leading: InkWell(
                              onTap: (){Navigator.pop(context);},
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(color: Colors.grey.shade300)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(13.0),
                                  child: Icon(Icons.arrow_back_rounded,color: Colors.grey.shade200,size: 20,),
                                ),
                              ),
                            ),
                            trailing: InkWell(
                              onTap: (){Navigator.pop(context);},
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(color: Colors.grey.shade300)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(13.0),
                                  child: Icon(Icons.share,color: Colors.grey.shade200,size: 20,),
                                ),
                              ),
                            ),
                            title: Center(
                                child: Text('Thông tin bệnh nhân', style: GoogleFonts.nunitoSans(
                                    fontSize: 18, fontWeight: FontWeight.w700,color: Colors.white),
                                )),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: size.height*0.816,color: Colors.white,
                      width: size.width,
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Padding(
                        padding: EdgeInsets.only(top: size.height*0.1),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Chẩn đoán',
                                style: GoogleFonts.nunitoSans(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),
                              ),
                              const SizedBox(height: 10,),
                              Text(
                                diagnose(controller.record?.ListLichSu ?? []),
                                style: GoogleFonts.nunitoSans(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey.shade600),
                              ),
                              Expanded(
                                  child: ListView.builder(
                                    physics: const NeverScrollableScrollPhysics(),
                                    controller: ScrollController(),
                                      itemCount: list.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, i) => itemTreatment(list[i]),
                                  )
                              ),
                        ],
                      ),
                        ),
                      ),
                    )
                  ],
                ),
                Positioned(
                  top: size.height*0.09,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: InforPatient(record: controller.record,),
                    )
                )
              ],
            );
          }
          )
        )
      ),
    );
  }
  Widget itemTreatment(String title){
    return InkWell(
      onTap: (){Get.to(() => const MedicalReportScreen());},
      child: Container(
        margin: const EdgeInsets.only(top: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFDCEDF9))
        ),
        child: ListTile(
          title: Text(title,style: GoogleFonts.nunitoSans(fontSize: 16,fontWeight: FontWeight.w700,color: ColorResources.getPrimaryColor()),),
          trailing: Icon(Icons.arrow_forward_ios,color: ColorResources.getPrimaryColor(),),
        )
      ),
    );
  }
  String diagnose (List<LichSu> list){
    StringBuffer sb = StringBuffer();
    for(var i in list){
      sb.write(i.ChanDoan);
      if(i != list.last && i.ChanDoan.isNotEmpty){
        sb.write('; ');
      }
    }
    return sb.toString().isNotEmpty ? sb.toString() : "Không có chẩn đoán";
  }
}
