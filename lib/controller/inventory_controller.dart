import 'dart:async';

import 'package:get/get.dart';
import 'package:timesheet/data/repository/inventory_repo.dart';

import '../data/model/response/department.dart';
import '../data/model/response/page.dart';

class InventoryController extends GetxController implements GetxService {
  final InventoryRepo repo;

  InventoryController({required this.repo}) ;

  List<Department>? _listDepartment;

  List<Department>? get listDepartment => _listDepartment;

  bool _loading = false;

  bool get loading => _loading;

  List<Department>? _listAsset;

  List<Department>? get listAsset => _listAsset;

  void getDepartment() async {
    _loading = true;
    update();
    await repo.getAllDepartment().then(
      (value) {
        if (value.statusCode == 200) {
          _listDepartment = Page.fromJson(value.body).content;
        }
      },
    );
    _loading = false;
    Timer(const Duration(seconds: 1), () {
      update();
    });
  }

  void getItemOfDepartment(String id){
    repo.getItemOfDepartment(id).then((value) => {
      print(value.body)
    });
  }
}
