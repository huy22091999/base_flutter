import 'package:get/get.dart';
import 'package:timesheet/data/model/response/config_response.dart';
import 'package:timesheet/data/repository/splash_repo.dart';
import 'package:timesheet/utils/app_constants.dart';

class SplashController extends GetxController implements GetxService {
  final SplashRepo repo;

  SplashController({required this.repo});

  String _hospitalName = '';
  String get hospitalName => _hospitalName;

  final bool _hasConnection = true;

  bool get hasConnection => _hasConnection;

  final String _version = "";

  String get version => _version;

  Future<bool> isUpdateVersion() async {
    // Response response = await repo.getConfig();
    // if (response.statusCode == 200) {
    //   ConfigResponse _data = ConfigResponse.fromJson(response.body);
    //   return _data.versionName == AppConstants.APP_VERSION;
    // } else {
    //   return false;
    // }
    return true;
  }
  Future<void> getHospitalName() async {
    Response response = await repo.getHospitalName();
    if (response.statusCode == 200) {
      _hospitalName = response.body['data'];
    }
  }
}
