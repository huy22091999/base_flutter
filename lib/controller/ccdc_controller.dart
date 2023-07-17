import 'package:get/get.dart';
import 'package:timesheet/data/api/api_checker.dart';
import 'package:timesheet/data/model/body/model_ccdc/ccdc.dart';
import 'package:timesheet/data/repository/inventory_repo.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../data/model/body/model_ccdc/item_content.dart';

class CCDCController extends GetxController implements GetxService{
  final PagingController<int, ItemContent> _pagingController = PagingController(firstPageKey: 1);

  final InventoryRepo repo;
  CCDCController({required this.repo});
  bool _loading = false;
  CCDC _ccdc = CCDC();
  bool get loading => _loading;
  CCDC get ccdc => _ccdc;

  @override
  void onInit() {
    super.onInit();
    _pagingController.addPageRequestListener((pageKey) {

    });
  }

  Future<int> getAllocationVouchers(int? index) async {
    _loading = true;
    update();
    Response response = await repo.getAllocationVouchers(index);
    if(response.statusCode == 200){
      _ccdc = CCDC.fromJson(response.body);
    }
    else {
      ApiChecker.checkApi(response);
    }
    _loading = false;
    update();
    return response.statusCode!;
  }
}