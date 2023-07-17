import 'dart:async';

import 'package:get/get.dart';
import 'package:timesheet/utils/app_constants.dart';

import '../api/api_client.dart';

class ScanRepo {
  final ApiClient apiClient;

  ScanRepo({required this.apiClient});

  Future<Response> getAssetInfo(String code) async {
    return apiClient.getData("${AppConstants.GET_ASSET_INFO}/$code");
  }
}
