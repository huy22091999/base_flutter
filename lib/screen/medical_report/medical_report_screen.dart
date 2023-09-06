import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/color_resources.dart';

class MedicalReportScreen extends StatefulWidget {
  const MedicalReportScreen({super.key});

  @override
  State<MedicalReportScreen> createState() => _MedicalReportScreenState();
}

class _MedicalReportScreenState extends State<MedicalReportScreen> with TickerProviderStateMixin{

  var indexTab = 0.obs;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                          child: Text('Bệnh án', style: GoogleFonts.nunitoSans(
                              fontSize: 18, fontWeight: FontWeight.w700,color: Colors.white),
                          )),
                    ),
                    const SizedBox(height: 16,),
                    SizedBox(
                      height: 46,
                      width: size.width - 32,
                      child: Obx(() => tab())
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFf4A261)),
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFfF4A261),
                          borderRadius: BorderRadius.only(topRight:  Radius.circular(8),topLeft: Radius.circular(8))
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        'Ngày chỉ định 01/10/2023',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w700,color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 16,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Khoa/Phòng chỉ định',style: GoogleFonts.nunitoSans(fontSize: 13,fontWeight: FontWeight.w700,color: ColorResources.getPrimaryColor()),),
                          Text('Người chỉ định',style: GoogleFonts.nunitoSans(fontSize: 13,fontWeight: FontWeight.w700,color: ColorResources.getPrimaryColor()),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Ngoại khoa nội tim mạch',style: GoogleFonts.nunitoSans(fontSize: 13,fontWeight: FontWeight.w400,),),
                          Text('BS.Phạm Thị Hiền',style: GoogleFonts.nunitoSans(fontSize: 13,fontWeight: FontWeight.w400,),)
                        ],
                      ),
                    ),
                    const SizedBox(height: 16,),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      color: const Color(0x261C6BA4),
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        'XÉT NGHIỆM HUYẾT HỌC',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunitoSans(
                            fontSize: 14, fontWeight: FontWeight.w800,color: ColorResources.getPrimaryColor()),
                      ),
                    ),
                    const SizedBox(height: 16,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Ngày trả KQ',style: GoogleFonts.nunitoSans(fontSize: 13,fontWeight: FontWeight.w700,color: ColorResources.getPrimaryColor()),),
                          Text('Người trả KQ',style: GoogleFonts.nunitoSans(fontSize: 13,fontWeight: FontWeight.w700,color: ColorResources.getPrimaryColor()),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('20/02/2023',style: GoogleFonts.nunitoSans(fontSize: 13,fontWeight: FontWeight.w400,),),
                          Text('BS.Phạm Thị Hiền',style: GoogleFonts.nunitoSans(fontSize: 13,fontWeight: FontWeight.w400,),)
                        ],
                      ),
                    ),
                    const SizedBox(height: 16,),
                    Text(
                      'Tổng phân tích tế bào máu ngoại vi',
                      style: GoogleFonts.nunitoSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: ColorResources.getPrimaryColor()),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '(Bằng máy đếm tổng trở)',
                      style: GoogleFonts.nunitoSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: ColorResources.getPrimaryColor()),
                      textAlign: TextAlign.center,
                    ),
                    itemReport(),
                    itemReport(),
                    itemReport(),
                    itemReport(),
                    const SizedBox(height: 16,),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  tab(){
    return Row(
      children: [
        Expanded(child: InkWell(
          onTap: (){indexTab.value = 0;},
          child: Container(
            decoration: BoxDecoration(
                color: indexTab.value == 0 ? Colors.white : ColorResources.getPrimaryColor(),
                border: Border.all(color: Colors.white),
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(8),bottomLeft: Radius.circular(8))
            ),
            child: Center(
                child: Text(
                  'Xét nghiệm',
                  style: GoogleFonts.nunitoSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: indexTab.value == 0 ? ColorResources.getPrimaryColor() : Colors.white),
                )),
          ),
        )),
        Expanded(child: InkWell(
          onTap: (){indexTab.value = 1;},
          child: Container(
            decoration: BoxDecoration(
                color: indexTab.value == 1 ? Colors.white : ColorResources.getPrimaryColor(),
                border: const Border.symmetric(horizontal: BorderSide(color: Colors.white))
            ),
            child: Center(
              child: Text(
                'CĐHA',
                style: GoogleFonts.nunitoSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: indexTab.value == 1
                        ? ColorResources.getPrimaryColor()
                        : Colors.white),
              ),
            ),
          ),
        )),
        Expanded(child: InkWell(
          onTap: (){indexTab.value = 2;},
          child: Container(
            decoration: BoxDecoration(
                color: indexTab.value == 2 ? Colors.white : ColorResources.getPrimaryColor(),
                borderRadius: const BorderRadius.only(topRight: Radius.circular(8),bottomRight: Radius.circular(8)),
                border: Border.all(color: Colors.white)
            ),
            child: Center(
                child: Text(
                  'Thuốc',
                  style: GoogleFonts.nunitoSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: indexTab.value == 2
                          ? ColorResources.getPrimaryColor()
                          : Colors.white),
                )),
          ),
        ))
      ],
    );
  }
  itemReport(){
    return Container(
      margin: const EdgeInsets.only(left: 16,right: 16,top: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xffE7ECED)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('RBC (Số lượng hồng cầu)',style: GoogleFonts.nunitoSans(fontSize: 16,fontWeight: FontWeight.w600),textAlign: TextAlign.start,),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Ngày trả KQ',style: GoogleFonts.nunitoSans(fontSize: 13,fontWeight: FontWeight.w700,color: ColorResources.getPrimaryColor()),),
              Text('20/02/2023',style: GoogleFonts.nunitoSans(fontSize: 13,fontWeight: FontWeight.w700,color: ColorResources.getPrimaryColor()),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(text: TextSpan(
                children: [
                  TextSpan(text: '4.4 ',style: GoogleFonts.nunitoSans(fontWeight: FontWeight.w700,fontSize: 13,color: Colors.black)),
                  TextSpan(text: 'T/l',style: GoogleFonts.nunitoSans(fontWeight: FontWeight.w400,fontSize: 13,color: Colors.black))
                ]
              )),
              Text('3.8 - 5.8',style: GoogleFonts.nunitoSans(fontSize: 13,fontWeight: FontWeight.w700,),)
            ],
          ),
        ],
      ),
    );
  }
}
