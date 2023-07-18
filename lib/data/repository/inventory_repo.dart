import 'dart:async';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timesheet/utils/app_constants.dart';

import '../api/api_client.dart';

class InventoryRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  InventoryRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> getAllocationVouchers(int? index) async {
    if (index != null) {
      Map<String, dynamic> query = {
        'keyword': '',
        'statusIndex': index.toString()
      };
      return await apiClient.getData(AppConstants.GET_ALLOCATION_VOUCHERS,
          query: query);
    }
    return await apiClient.getData(AppConstants.GET_ALLOCATION_VOUCHERS);
  }

  Future<Response> getAllDepartment(int pageIndex) async {
    Map<String, dynamic> query = {'pageIndex': '$pageIndex', 'pageSize': '10'};
    return await apiClient.postDataNewApi(
        AppConstants.GET_DEPARTMENT, query, null);
  }

  Future<Response> getItemOfDepartment(String idDepartment) async {
    Map<String, dynamic> query = {'useDepartmentId' : idDepartment};
    return await apiClient.getDataNewApi(AppConstants.GET_ITEM_DEPARTMENT,query: query,headers: null);
  }
}
