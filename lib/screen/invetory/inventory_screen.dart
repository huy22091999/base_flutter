import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:timesheet/screen/invetory/widgets/item_department.dart';
import 'package:timesheet/utils/color_resources.dart';

import '../../controller/inventory_controller.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<StatefulWidget> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  var fromDate = DateFormat('dd/MM/yyyy').format(DateTime.now()).obs;
  var toDate = DateFormat('dd/MM/yyyy').format(DateTime.now()).obs;
  final _status = 'Chưa KK'.obs;

  @override
  void initState() {
    Get.find<InventoryController>().getDepartment();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        title: const Text('Kiểm kê',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
        height: 20,
            ),
            Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              _selectDate(context, 0);
            },
            child: Row(
              children: [
                const Text(
                  'Từ:',
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                    margin: const EdgeInsets.only(left: 8),
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: const BorderRadius.all(
                                Radius.circular(8))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 8),
                          child: Row(
                            children: [
                              Obx(
                                () => Text(
                                  "$fromDate",
                                  style:
                                      const TextStyle(fontSize: 16),
                                ),
                              ),
                              Icon(
                                Icons.calendar_month,
                                color: ColorResources.getMainColor(),
                              )
                            ],
                          ),
                        )))
              ],
            ),
          ),
          Container(),
          GestureDetector(
            onTap: () {
              _selectDate(context, 1);
            },
            child: Row(
              children: [
                const Text(
                  'Đến:',
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                    margin: const EdgeInsets.only(left: 8),
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: const BorderRadius.all(
                                Radius.circular(8))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 8),
                          child: Row(
                            children: [
                              Obx(() => Text(
                                    "$toDate",
                                    style:
                                        const TextStyle(fontSize: 16),
                                  )),
                              Icon(
                                Icons.calendar_month,
                                color: ColorResources.getMainColor(),
                              )
                            ],
                          ),
                        )))
              ],
            ),
          ),
        ],
            ),
            const SizedBox(
        height: 24,
            ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        setStatusInventory('Chưa KK');
                      },
                      child: Row(
                        children: [
                          Obx(
                            () => SizedBox(
                              width: 24,
                              height: 24,
                              child: Radio(
                                value: 'Chưa KK',
                                groupValue: _status.value,
                                onChanged: (value) {
                                  setStatusInventory(value!);
                                },
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                activeColor: ColorResources.getMainColor(),
                                visualDensity: const VisualDensity(
                                    horizontal: -4, vertical: -4),
                              ),
                            ),
                          ),
                          const Expanded(
                              child:
                                  AutoSizeText('Chưa KK (23)', maxLines: 1)),
                        ],
                      ),
                    )),
                Expanded(
                    flex: 1,
                child: GestureDetector(
                  onTap: () {
                    setStatusInventory('Đang KK');
                  },
                  child: Row(
                    children: [
                      Obx(
                        () => SizedBox(
                          width: 24,
                          height: 24,
                          child: Radio(
                            value: 'Đang KK',
                            groupValue: _status.value,
                            onChanged: (value) {
                              setStatusInventory(value!);
                            },
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            activeColor:
                                ColorResources.getMainColor(),
                            visualDensity: const VisualDensity(
                                horizontal: -4, vertical: -4),
                          ),
                        ),
                      ),
                      const Expanded(
                          child: AutoSizeText('Đang KK (12)',
                              maxLines: 1)),
                    ],
                  ),
                )),
            Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    setStatusInventory('Đã kiểm kê');
                  },
                  child: Row(
                    children: [
                      Obx(
                        () => SizedBox(
                          width: 24,
                          height: 24,
                          child: Radio(
                            value: 'Đã kiểm kê',
                            groupValue: _status.value,
                            onChanged: (value) {
                              setStatusInventory(value!);
                            },
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            activeColor:
                                ColorResources.getMainColor(),
                            visualDensity: const VisualDensity(
                                horizontal: -4, vertical: -4),
                          ),
                        ),
                      ),
                      const Expanded(
                          child: AutoSizeText(
                        'Đã kiểm kê (14)',
                        maxLines: 1,
                      )),
                    ],
                  ),
                )),
            ],
          ),
            ),
            const SizedBox(
        height: 20,
            ),
            //new child
          Expanded(
            child: GetBuilder<InventoryController>(
              builder: (controller) {
                return controller.loading
                    ? Center(child: CircularProgressIndicator(color: ColorResources.getMainColor(),),)
                    : controller.listDepartment != null &&
                            controller.listDepartment!.isNotEmpty
                        ? ListView.builder(
                            controller: ScrollController(),
                            shrinkWrap: true,
                            itemCount: controller.listDepartment?.length,
                            itemBuilder: (context, index) => ItemDepartment(
                                  department: controller.listDepartment![index],
                                ))
                        : const Text("Không có phòng ban hiển thị");
              },
            ),
          ),
        ]),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, int index) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
      locale: const Locale('vi', 'VN'),
    );
    if (picked != null) {
      switch (index) {
        case 0:
          fromDate.value = formatDate(picked);
        case 1:
          toDate.value = formatDate(picked);
      }
    }
  }

  String formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  void setStatusInventory(String value) {
    _status.value = value;
  }
}
