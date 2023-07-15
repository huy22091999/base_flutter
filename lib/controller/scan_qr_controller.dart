import 'package:get/get.dart';
import '../data/model/body/model_ccdc/ccdc.dart';

class QrController extends GetxController implements GetxService{

  final List<CCDC> _list = [];
  bool _openBottomSheet = false;
  bool _loading = false;
  bool _scanSuccess = false;

  bool get openBottomSheet => _openBottomSheet;
  bool get loading => _loading;
  bool get scanSuccess => _scanSuccess;
  List<CCDC> get list => _list;

  void resetStatus(){
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
  void clearData(){
    _loading = false;
    _openBottomSheet = false;
    _scanSuccess = false;
  }
}