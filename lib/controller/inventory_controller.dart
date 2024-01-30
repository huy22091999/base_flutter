import 'dart:async';

import 'package:get/get.dart';
import 'package:timesheet/data/api/api_checker.dart';
import 'package:timesheet/data/model/response/asset_info.dart';
import 'package:timesheet/data/model/response/oct_response.dart';
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

  List<AssetInfo>? _listAsset;

  List<AssetInfo>? get listAsset => _listAsset;


  Future<void> getDepartment(int pageIndex) async {
    if(listDepartment == null || listDepartment!.isEmpty){
      _loading = true;
      update();
    }
    await repo.getAllDepartment(pageIndex).then(
      (value) {
        if (value.statusCode == 200 && value.body['content'] != null) {
          if(listDepartment != null && listDepartment!.isNotEmpty){
            var newData = Page.fromJson(value.body).content;
            listDepartment!.addAll(newData);
          }
          else {
            _listDepartment = Page.fromJson(value.body).content;
          }
        }
        else {
          ApiChecker.checkApi(value);
        }
      },
    );
      _loading = false;
      Timer(const Duration(milliseconds: 400), () {
        update();
      });
  }

  Future<void> getItemOfDepartment(String id) async {
    await repo.getItemOfDepartment(id).then((value) {
      if(value.statusCode == 200) {
        final data = OctResponse.fromJson(value.body).data;
        _listAsset = data.map((item) => AssetInfo.fromJson(item)).toList();
      }
    });
    _loading = false;
    update();
  }

  void clearData(){
    _listAsset = [];
    _listDepartment = [];
    _loading = false;
  }
}
