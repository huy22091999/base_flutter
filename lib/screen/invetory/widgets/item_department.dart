import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timesheet/data/model/response/department.dart';
import 'package:timesheet/utils/color_resources.dart';

import '../../../helper/route_helper.dart';

class ItemDepartment extends StatelessWidget {
  final Department department;

  const ItemDepartment({super.key, required this.department});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            margin: const EdgeInsets.only(right: 8),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    department.text ?? "",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: ColorResources.getMainColor(),
                      overflow: TextOverflow.visible,
                      height: 1.5
                    ),
                    softWrap: true,
                    maxLines: 2,
                  ),
                ),
                const SizedBox(width: 6,),
                ElevatedButton(
                  onPressed: () {
                    // Get.find<InventoryController>().getItemOfDepartment(department.id!);
                    // Get.to(() => const ListInventoryScreen(),
                    //     transition: Transition.rightToLeftWithFade,
                    //     duration: const Duration(milliseconds: 400));

                    Get.offNamed(RouteHelper.getListInventory(department.id!));
                  },
                  style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                      ),
                      backgroundColor: ColorResources.getMainColor()),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("Kiểm kê"),
                  ),
                )
              ],
            ),
          ),
        ),
        const Divider(
          height: 1,
          color: Colors.grey,
        )
      ],
    );
  }
}
