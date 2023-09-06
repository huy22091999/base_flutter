
import 'package:get/get.dart';
import 'package:timesheet/data/api/api_checker.dart';
import 'package:timesheet/data/model/body/user.dart';
import 'package:timesheet/data/model/response/token_resposive.dart';
import 'package:timesheet/data/repository/auth_repo.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo repo;

  AuthController({required this.repo});

  bool _loading = false;
  User _user = User();

  bool get loading => _loading;
  User get user => _user;

  Future<int> login(String username, String password) async {
    _loading = true;
    update();
    TokenResponsive? tokeBody;
    Response response = await repo.login(username: username, password: password);
    if (response.statusCode == 200) {
      tokeBody = TokenResponsive.fromJson(response.body);
      if(tokeBody.Status == 0){
        repo.saveUserToken(tokeBody.ClientID!);
      }
    }
    else {
      ApiChecker.checkApi(response);
    }
    _loading = false;
    update();
    return tokeBody?.Status ?? 2;
  }
  Future<int> logOut() async {
    _loading = true;
    Response response = await repo.logOut();
    if(response.statusCode == 200){
      repo.clearUserToken();
    }
    else {
      ApiChecker.checkApi(response);
    }
    _loading = false;
    update();
    return response.statusCode!;
  }
  Future<int> getCurrentUser() async {
    Response response = await repo.getCurrentUser();
    if(response.statusCode == 200){
      _user = User.fromJson(response.body);
      update();
    }
    return _user.status ?? 1;
  }
  void clearData(){
    _loading = false;
    _user = User();
  }
}
