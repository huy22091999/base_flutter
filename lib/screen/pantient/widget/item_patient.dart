import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timesheet/data/model/body/patient.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timesheet/helper/route_helper.dart';
import 'package:timesheet/utils/color_resources.dart';
import 'package:get/get.dart';

class ItemPatient extends StatelessWidget {
  final Patient patient;
  const ItemPatient({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){Get.toNamed(RouteHelper.treatment,arguments: patient.MedicalRecordID);},
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(spreadRadius: 1,blurRadius: 3,color: Colors.grey.shade300)
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(patient.GioiTinh == 'Nam' ? 'assets/image/male.svg' : 'assets/image/female.svg',),
                      const SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(patient.PatientName,style: GoogleFonts.nunitoSans(
                            fontSize: 18,fontWeight: FontWeight.w600
                          ),),
                          RichText(text: TextSpan(
                            style: GoogleFonts.nunitoSans(fontSize: 10,fontWeight: FontWeight.w400,color: Colors.grey),
                            children: [
                              TextSpan(text: "Sinh năm ${patient.Tuoi.substring(patient.Tuoi.indexOf("(") + 1,patient.Tuoi.lastIndexOf(")"))} | ${patient.TuoiMobile} | ${patient.GioiTinh}"),
                              TextSpan(text: "   •  Đang điều trị",style: GoogleFonts.nunitoSans(fontSize: 10,fontWeight: FontWeight.w400,color: Colors.green),)
                            ]
                          ))
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      SvgPicture.asset('assets/image/id_card.svg'),
                      const SizedBox(width: 4,),
                      Text('Mã BN : ${patient.PatientCode}',style: GoogleFonts.nunitoSans(fontSize: 12,color: ColorResources.getPrimaryColor()),),
                      const Spacer(),
                      Icon(Icons.flag,color: Colors.yellow.shade700,size: 18,),
                      const SizedBox(width: 4,),
                      Text('Đối tượng : ${patient.FilterVienPhi && !patient.FilterBHYT ? 'Viện phí' : 'BHYT'}',style: GoogleFonts.nunitoSans(fontSize: 12,color: ColorResources.getPrimaryColor()),)
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.folder,size: 15,color: Colors.blue.shade700,),
                      const SizedBox(width: 4,),
                      Expanded(child: Text('#ACC: 22344, Chụp cắt lớp vi tính khớp gối thẳng nghiêng 32 dãy',style: GoogleFonts.nunitoSans(fontSize: 12,color: ColorResources.getPrimaryColor())))
                    ],
                  )
                ],
              ),
              Positioned(
                right: 0,
                child: InkWell(
                  onTap: (){},
                    child: const Icon(Icons.more_horiz)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
