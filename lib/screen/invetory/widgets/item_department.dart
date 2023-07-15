import 'package:flutter/material.dart';
import 'package:timesheet/screen/list_inventory_screen/list_inventory_screen.dart';
import 'package:timesheet/utils/color_resources.dart';
import 'package:get/get.dart';

class ItemDepartment extends StatelessWidget {
  const ItemDepartment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              Text(
                "Phòng hành chính quản trị",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: ColorResources.getMainColor()),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => const ListInventoryScreen(),
                      transition: Transition.rightToLeftWithFade,
                      duration: const Duration(milliseconds: 400));
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
        const Divider(
          height: 1,
          color: Colors.grey,
        )
      ],
    );
  }
}
