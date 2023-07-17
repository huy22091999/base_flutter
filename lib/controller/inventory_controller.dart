import 'package:get/get.dart';
import 'package:timesheet/data/repository/inventory_repo.dart';

import '../data/model/response/department.dart';
import '../data/model/response/page.dart';

class InventoryController extends GetxController implements GetxService {
  final InventoryRepo repo;

  InventoryController({required this.repo}) {
    getDepartment();
  }

  List<Department>? _listDepartment;

  List<Department>? get listDepartment => _listDepartment;

  bool _loading = false;

  bool get loading => _loading;

  void getDepartment() async {
    _loading = true;
    update();
    repo.getAllDepartment().then(
      (value) {
        if (value.statusCode == 200) {
          _listDepartment = Page.fromJson(value.body).content;
        }
      },
    );
    _loading = false;
    update();
  }
}
