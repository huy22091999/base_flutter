import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timesheet/controller/inventory_controller.dart';
import 'package:timesheet/controller/scan_qr_controller.dart';
import 'package:timesheet/data/model/response/asset_info.dart';
import 'package:timesheet/screen/list_inventory_screen/item.dart';
import 'package:timesheet/screen/scan_qr_screen.dart';
import 'package:lottie/lottie.dart';

import '../../utils/color_resources.dart';

class ListInventoryScreen extends StatefulWidget {
  final String id;

  const ListInventoryScreen({super.key, required this.id});

  @override
  State<StatefulWidget> createState() => _ListInventoryScreenState();
}

class _ListInventoryScreenState extends State<ListInventoryScreen>
    with TickerProviderStateMixin {
  final _loading = true.obs;
  @override
  void initState() {
    Get.find<InventoryController>().getItemOfDepartment(widget.id).then((value) => {
      _loading.value = false
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: const EdgeInsets.only(top: 8, left: 8),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: ColorResources.getMainColor())),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: ColorResources.getMainColor(),
                  size: 20,
                ),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        title: const Text('Kiểm kê TSCĐ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: (){
              Get.to(() => const QRScannerPage(),arguments: 'Inventory');
            },
            child: Container(
                margin: const EdgeInsets.only(top: 16,right: 16),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorResources.getMainColor()),
                child: ColorFiltered(
                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  child: Lottie.asset(
                      'assets/animationFile/qr_scan_animation.json',
                      fit: BoxFit.contain,
                      height: 48,
                      width: 48),
                )),
          )
        ],
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
                      color: Colors.grey.shade300),
                  child:  TabBar(
                    controller: TabController(length: 3,vsync: this),
                    indicator: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(16)),
                        color: ColorResources.getMainColor()
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black87,
                    labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                    tabs: const [
                      Tab(text: 'Chưa kiểm kê',),
                      Tab(text: 'Đã kiểm kê',),
                      Tab(text: 'Ghi chú',)
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                Obx(
                  () => _loading.value
                      ? SizedBox(
                        height: height * 0.6,
                        child: Center(
                            child: CircularProgressIndicator(color: ColorResources.getMainColor(),),
                          ),
                      )
                      : SizedBox(
                          height: height * 0.6,
                          child: GetBuilder<InventoryController>(
                            builder: (controller) =>
                                controller.listAsset != null &&
                                        controller.listAsset!.isNotEmpty
                                    ? ListView.builder(
                                        shrinkWrap: true,
                                        controller: ScrollController(),
                                        itemCount: controller.listAsset!.length,
                                        itemBuilder: (context, index) {
                                          return Item(
                                            asset: controller.listAsset![index],
                                          );
                                        })
                                    : const Center(
                                        child: Text('Không có bản ghi nào'),
                                      ),
                          )),
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