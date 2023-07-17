import 'package:get/get.dart';
import 'package:timesheet/data/model/response/asset_info.dart';
import 'package:timesheet/data/repository/scan_repo.dart';

import '../data/model/body/model_ccdc/ccdc.dart';

class QrController extends GetxController implements GetxService {
  late ScanRepo scanRepo;

  QrController({required this.scanRepo});

  final List<CCDC> _list = [];
  bool _openBottomSheet = false;
  bool _loading = false;
  bool _scanSuccess = false;

  AssetInfo? _assetInfo;

  AssetInfo? get assetInfo => _assetInfo;

  bool get openBottomSheet => _openBottomSheet;

  bool get loading => _loading;

  bool get scanSuccess => _scanSuccess;

  List<CCDC> get list => _list;

  void resetStatus() {
    _loading = !_loading;
    _openBottomSheet = !_openBottomSheet;
    _scanSuccess = !_scanSuccess;
    update();
  }

  Future<bool> addItem(CCDC item) {
    _list.add(item);
    update();
    return Future.value(true);
  }

  void clearData() {
    _loading = false;
    _openBottomSheet = false;
    _scanSuccess = false;
    _assetInfo = null;
  }

  void getInfoAsset(String code) {
    _loading = true;
    scanRepo.getAssetInfo(code).then(
      (value) {
        if (value.statusCode == 200) {
          ResponseAssetInfo response = ResponseAssetInfo.fromJson(value.body);
          _assetInfo = response.data;
        }
        _loading = false;
        update();
      },
    );
  }
}