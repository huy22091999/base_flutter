import 'dart:convert';

import 'package:timesheet/utils/app_constants.dart';

import '../api/api_client.dart';
import '../model/response/config_response.dart';
import 'package:get/get.dart';

class SplashRepo {
  final ApiClient apiClient;

  SplashRepo({required this.apiClient});

  Future<Response> getConfig() {
    return apiClient.getData(AppConstants.CONFIG_URI);
  }
  Future<Response> getHospitalName() {
    Map<String,String> body = {
      "data" : "TenBenhVien"
    };
    Map<String,String> header = {
      "Content-Type" : "application/json; charset=utf-8",
    };
    return apiClient.postData(AppConstants.HOSPITAL_NAME,json.encode(body),header);
  }
}
