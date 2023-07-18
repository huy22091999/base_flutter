import 'package:flutter/material.dart';

import '../../utils/color_resources.dart';

class ValueScanScreen extends StatefulWidget{
  const ValueScanScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ValueScanScreen();
}
class _ValueScanScreen extends State<ValueScanScreen>{
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    TextStyle style = TextStyle(color: ColorResources.getMainColor(),fontWeight: FontWeight.bold,fontSize: 14);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.grey.shade200,
        title: const Text('Kết quả kiểm kê',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(width*0.04, height*0.01, width*0.04, height*0.1),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text('TS0000001',style: style,),
                    ),
                    const SizedBox(height: 16,),
                    Text('Bàn vi tính KT1400*700mm ( Nguồn khác H1-7cấp )',style: style,),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textInfo('Nguyên giá', '1.190.000đ'),
                        textInfo('GTCL', '1.190.000đ'),
                      ],
                    ),
                    const SizedBox(height: 12,),
                    textInfo('Mã quản lý', '00768 Khoa C7'),
                    const SizedBox(height: 12,),
                    textInfo('Mã kế toán', '-'),
                    const SizedBox(height: 12,),
                    textInfo('Khoa phòng sử dụng', 'Khoa điều trị tổng hợp'),
                    const SizedBox(height: 12,),
                    textInfo('Số lượng', '1'),
                    const SizedBox(height: 12,),
                    textInfo('Model', '-'),
                    const SizedBox(height: 12,),
                    textInfo('Seri', '-'),
                    const SizedBox(height: 20,),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: true,
                            onChanged: (bool? value) {},
                          ),
                          const Text('Tài sản đúng phòng ban',style: TextStyle(color: Color(0xff7dbb00),fontSize: 14,fontWeight: FontWeight.w900),)
                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                    SizedBox(
                      height: 120,
                      child: TextFormField(
                        maxLines: null,
                        expands: true,
                        textAlignVertical: TextAlignVertical.top,
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            hintText: 'Nhập ghi chú',
                            filled: true,
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                  color: ColorResources.getMainColor(),
                                ))),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: OutlinedButton(
                              onPressed: (){},
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: ColorResources.getMainColor())
                            ), child: Text('Hủy',style: TextStyle(color: ColorResources.getMainColor()),),
                          ),
                        ),
                        const SizedBox(width: 30,),
                        Expanded(
                          flex: 1,
                          child: ElevatedButton(
                            onPressed: (){},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: ColorResources.getMainColor()
                            ), child: const Text('Xác nhận',style: TextStyle(color: Colors.white),),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget textInfo(String title, String content){
    return  RichText(text:  TextSpan(
        children: [
          TextSpan(text : '$title : ',style: const TextStyle(color: Colors.black)),
          TextSpan(text: content,style: const TextStyle(color: Colors.deepOrange))
        ]
    ));
  }
}