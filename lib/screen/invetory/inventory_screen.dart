import 'package:flutter/material.dart';
import 'package:timesheet/screen/invetory/widgets/item_department.dart';
import 'package:timesheet/utils/color_resources.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:animate_do/animate_do.dart';

class InventoryScreen extends StatefulWidget{
  const InventoryScreen({super.key});

  @override
  State<StatefulWidget> createState() => _InventoryScreenState();
}
class _InventoryScreenState extends State<InventoryScreen>{
  var fromDate = DateFormat('dd/MM/yyyy').format(DateTime.now()).obs;
  var toDate = DateFormat('dd/MM/yyyy').format(DateTime.now()).obs;
  final _status = 'Chưa KK'.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: GestureDetector(
            onTap: (){Navigator.pop(context);},
            child: Container(
              margin: const EdgeInsets.only(top: 8,left: 8),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: ColorResources.getMainColor())
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child:  Icon(Icons.arrow_back_ios_new_outlined,color: ColorResources.getMainColor(),size: 20,),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        title: const Text('Kiểm kê',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FadeInLeft(
                    duration: const Duration(milliseconds: 600),
                    child: GestureDetector(
                      onTap: (){_selectDate(context,0);},
                      child: Row(
                        children: [
                          const Text('Từ:',style: TextStyle(fontSize: 16),),
                          Container(
                            margin: const EdgeInsets.only(left: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: const BorderRadius.all(Radius.circular(8))
                              ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 8),
                                  child: Row(
                                    children: [
                                      Obx(() => Text("$fromDate",style: const TextStyle(fontSize: 16),),),
                                      Icon(Icons.calendar_month,color: ColorResources.getMainColor(),)
                                    ],
                                  ),
                                )
                            )
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(),
                  FadeInRight(
                    duration: const Duration(milliseconds: 600),
                    child: GestureDetector(
                      onTap: (){_selectDate(context,1);},
                      child: Row(
                        children: [
                          const Text('Đến:',style: TextStyle(fontSize: 16),),
                          Container(
                              margin: const EdgeInsets.only(left: 8),
                              child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: const BorderRadius.all(Radius.circular(8))
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 8),
                                    child: Row(
                                      children: [
                                        Obx(() => Text("$toDate",style: const TextStyle(fontSize: 16),)),
                                        Icon(Icons.calendar_month,color: ColorResources.getMainColor(),)
                                      ],
                                    ),
                                  )
                              )
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24,),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: FadeInUp(
                  duration: const Duration(milliseconds: 600),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: (){setStatusInventory('Chưa KK');},
                          child: Row(
                            children: [
                              Obx(() => SizedBox(
                                width : 24,
                                height: 24,
                                child: Radio(
                                  value: 'Chưa KK',
                                  groupValue: _status.value,
                                  onChanged: (value){setStatusInventory(value!);},
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  activeColor: ColorResources.getMainColor(),
                                  visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                                ),
                              ),),
                              const Expanded(child: AutoSizeText('Chưa KK (23)',maxLines: 1)),
                            ],
                          ),
                        )
                      ),
                      Expanded(
                        flex: 1,
                        child:GestureDetector(
                          onTap: (){setStatusInventory('Đang KK');},
                          child: Row(
                            children: [
                              Obx(() => SizedBox(
                                width : 24,
                                height: 24,
                                child: Radio(
                                  value: 'Đang KK',
                                  groupValue: _status.value,
                                  onChanged: (value){setStatusInventory(value!);},
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  activeColor: ColorResources.getMainColor(),
                                  visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                                ),
                              ),),
                              const Expanded(child: AutoSizeText('Đang KK (12)',maxLines: 1)),
                            ],
                          ),
                        )
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: (){setStatusInventory('Đã kiểm kê');},
                          child: Row(
                            children: [
                              Obx(() => SizedBox(
                                width : 24,
                                height: 24,
                                child: Radio(
                                  value: 'Đã kiểm kê',
                                  groupValue: _status.value,
                                  onChanged: (value){setStatusInventory(value!);},
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  activeColor: ColorResources.getMainColor(),
                                  visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                                ),
                              ),),
                              const Expanded(child: AutoSizeText('Đã kiểm kê (14)',maxLines: 1,)),
                            ],
                          ),
                        )
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              ListView.builder(
                shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context,index) => FadeInUp(
                      duration: const Duration(milliseconds: 600),
                      delay: Duration(milliseconds: index*100),
                      child: const ItemDepartment())
              )
            ],
          ),
        ),
      ),
    );
  }
  Future<void> _selectDate(BuildContext context, int index) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
      locale: const Locale('vi','VN'),
    );
    if (picked != null) {
      switch(index){
        case 0 : fromDate.value = formatDate(picked);
        case 1 : toDate.value = formatDate(picked);
      }
    }
  }
  String formatDate(DateTime date){
    return DateFormat('dd/MM/yyyy').format(date);
  }
  void setStatusInventory(String value){
    _status.value = value;
  }
}