import 'package:flutter/material.dart';
import 'package:timesheet/controller/scan_qr_controller.dart';
import 'package:timesheet/screen/list_inventory_screen/item.dart';
import 'package:get/get.dart';
import 'package:timesheet/screen/scan_qr_screen.dart';
import '../../controller/ccdc_controller.dart';
import '../../utils/color_resources.dart';

class ListInventoryScreen extends StatefulWidget{
  const ListInventoryScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ListInventoryScreenState();
}
class _ListInventoryScreenState extends State<ListInventoryScreen> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
        title: const Text('Kiểm kê TSCĐ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          height: height,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    color: Colors.grey.shade300
                  ),
                  child:  TabBar(
                    controller: TabController(length: 2,vsync: this),
                    indicator: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(16)),
                        color: ColorResources.getMainColor()
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black87,
                    labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                    tabs: const [
                      Tab(text: 'Chưa kiểm kê',),
                      Tab(text: 'Đã kiểm kê',)
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  width: width,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: (){Get.to(() => const QRScannerPage(),arguments: "Inventory");},
                    style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                        ),
                        backgroundColor: ColorResources.getMainColor()
                    ),
                      child: const Text('QUÉT MÃ QR',style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  height: height*0.6,
                  child: GetBuilder<QrController>(
                      builder: (controller) => controller.list.isNotEmpty ? ListView.builder(
                          shrinkWrap: true,
                          controller: ScrollController(),
                          itemCount: controller.list.length,
                          itemBuilder: (context, index) {
                            return Item(ccdc : controller.list[index]);
                          }) : const Center(child: Text('Không có bản ghi nào'),),
                  )
                ),
                const Spacer(),
                ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                        ),
                        backgroundColor: ColorResources.getMainColor()
                    ),
                    child: const Text('Hoàn thành',style: TextStyle(fontWeight: FontWeight.bold),)
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}