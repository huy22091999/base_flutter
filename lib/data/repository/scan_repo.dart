import 'dart:async';

import 'package:get/get.dart';
import 'package:timesheet/data/model/response/asset_info.dart';
import 'package:timesheet/utils/app_constants.dart';

import '../api/api_client.dart';

class ScanRepo {
  final ApiClient apiClient;

  ScanRepo({required this.apiClient});

  Future<Response> getAssetInfo(String code) async {
    return apiClient.getData("${AppConstants.GET_ASSET_INFO}/$code");
  }

  Future<Response> saveNoteAsset(AssetInfo assetInfo) async {
    return apiClient.postDataNewApi(
        AppConstants.SAVE_NOTE_ASSET, assetInfo.toJson(), null);
  }
}
