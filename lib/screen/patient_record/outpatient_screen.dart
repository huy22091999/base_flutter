import 'package:flutter/material.dart';
import 'package:timesheet/controller/splash_controller.dart';
import 'package:timesheet/utils/color_resources.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class OutPatientScreen extends StatefulWidget {
  const OutPatientScreen({super.key});

  @override
  State<OutPatientScreen> createState() => _OutPatientScreenState();
}

class _OutPatientScreenState extends State<OutPatientScreen> {

  TextStyle labelStyle = GoogleFonts.nunitoSans(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 12);
  List<String> gender = ['Nam','Nữ','Khác'];
  List<String> type = ['BHYT','Thu phí','Miễn phí','Khác'];
  List<String> introductionPlace = ['Y tế','Tự đến'];
  var genderChecked = 'Nam'.obs;
  var typeChecked = 'BHYT'.obs;
  var placeChecked = 'Y tế'.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Bệnh án nắn chỉnh răng',style: GoogleFonts.nunitoSans(fontSize: 18,fontWeight: FontWeight.w700,color: Colors.red),),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        toolbarHeight: 80,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(text: TextSpan(
                          style: labelStyle,
                          children: [
                            const TextSpan(text: 'Sở Y TẾ : '),
                            TextSpan(text: 'Bộ Y Tế',style: GoogleFonts.nunitoSans(color: Colors.blue))
                          ]
                        )),
                        RichText(text: TextSpan(
                            style: labelStyle,
                            children: [
                              const TextSpan(text: 'Bệnh viện : '),
                              TextSpan(text: Get.find<SplashController>().hospitalName,style: GoogleFonts.nunitoSans(color: Colors.blue))
                            ]
                        )),
                        RichText(text: TextSpan(
                            style: labelStyle,
                            children: [
                              const TextSpan(text: 'Khoa : '),
                              TextSpan(text: 'Khoa phục hình',style: GoogleFonts.nunitoSans(color: Colors.blue))
                            ]
                        )),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(text: TextSpan(
                            style: labelStyle,
                            children: [
                              const TextSpan(text: 'Số lưu chữ : '),
                              TextSpan(text: '22PH001071',style: GoogleFonts.nunitoSans(color: Colors.blue))
                            ]
                        )),
                        RichText(text: TextSpan(
                            style: labelStyle,
                            children: [
                              const TextSpan(text: 'Mã y tế : '),
                              TextSpan(text: '01/01908/22/055926',style: GoogleFonts.nunitoSans(color: Colors.blue))
                            ]
                        )),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 20,),
                Text('I. HÀNH CHÍNH:',style: GoogleFonts.nunitoSans(color: Colors.red,fontWeight: FontWeight.w700,fontSize: 16),),
                textField('1. Họ và tên','IN HOA'),
                textField('2. Sinh ngày','dd/mm/yyyy',isDatePicker: true),
                const SizedBox(height: 10,),
                const Text('3. Giới tính'),
                const SizedBox(height: 6,),
                Obx(() => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 3),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF9FAFB),
                    border: Border.all(color: const Color(0xFFE5E7EB),width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: DropdownButton<String>(
                    value: genderChecked.value,
                    elevation: 2,
                    icon: const Icon(Icons.arrow_drop_down_outlined),
                    isExpanded: true,
                    underline: Container(color: Colors.transparent,),
                    onChanged: (String? value) {
                      genderChecked.value = value!;
                    },
                    items: gender.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                )),
                textField('4. Nghề nghiệp','Ví dụ : Công nhân'),
                textField('5. Dân tộc','Ví dụ : Kinh'),
                textField('6. Xã,phường','Ví dụ : Phường Hàng Bạc'),
                textField('7. Quận( Huyện, Thị Xã )','Ví dụ : Quận Hoàn Kiếm'),
                textField('8. Tỉnh,thành phố','Ví dụ : TP Hà Nội'),
                textField('9. Nơi làm việc','Điền đầy đủ'),
                const SizedBox(height: 10,),
                const Text('10. Đối tượng'),
                const SizedBox(height: 6,),
                Obx(() => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 3),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF9FAFB),
                    border: Border.all(color: const Color(0xFFE5E7EB),width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: DropdownButton<String>(
                    value: typeChecked.value,
                    elevation: 2,
                    icon: const Icon(Icons.arrow_drop_down_outlined),
                    isExpanded: true,
                    underline: Container(color: Colors.transparent,),
                    onChanged: (String? value) {
                      typeChecked.value = value!;
                    },
                    items: type.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                )),
                textField('11. Bảo hiểm y tế có giá trị đến','dd/mm/yyyy',isDatePicker: true),
                textField('12. Đến khám bệnh lúc','hh:mm, dd/mm/yyyy'),
                const SizedBox(height: 10,),
                const Text('13. Nơi giới thiệu'),
                const SizedBox(height: 6,),
                Obx(() => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 3),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF9FAFB),
                    border: Border.all(color: const Color(0xFFE5E7EB),width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: DropdownButton<String>(
                    value: placeChecked.value,
                    elevation: 2,
                    icon: const Icon(Icons.arrow_drop_down_outlined),
                    isExpanded: true,
                    underline: Container(color: Colors.transparent,),
                    onChanged: (String? value) {
                      placeChecked.value = value!;
                    },
                    items: introductionPlace.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                )),
                textField('14. Chẩn đoán nơi giới thiệu','-'),
                textField('15. Họ tên, địa chỉ người nhà khi cần báo tin','-'),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget textField(String label,String hint,{bool? isDatePicker}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10,),
        Text(label),
        const SizedBox(height: 6,),
        TextFormField(
          readOnly: isDatePicker != null,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: const Color(0xFFF9FAFB),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16,vertical: 18),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  width: 1,
                  color: Color(0xFFE5E7EB)),
              borderRadius: BorderRadius.circular(15),
            ),
            suffixIcon: isDatePicker != null ? const Icon(Icons.calendar_month,color: Colors.grey,) : null,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1.5,
                  color: isDatePicker != null ? const Color(0xFFE5E7EB) : ColorResources.getPrimaryColor()),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ],
    );
  }
}
