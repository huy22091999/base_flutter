import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timesheet/data/model/body/role.dart';
import 'package:timesheet/data/model/body/token_request.dart';
import 'package:timesheet/data/model/body/user.dart';

import '../../utils/app_constants.dart';
import '../api/api_client.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> login(
      {required String username, required String password}) async {
    //header login
    var token = "Basic Y29yZV9jbGllbnQ6c2VjcmV0";
    var languageCode = sharedPreferences.getString(AppConstants.LANGUAGE_CODE);
    Map<String, String> _header = {
      'Content-Type': 'application/x-www-form-urlencoded',
      AppConstants.LOCALIZATION_KEY:
          languageCode ?? AppConstants.languages[0].languageCode,
      'Authorization': '$token'
    };
    //call api login
    return await apiClient.postDataLogin(
        AppConstants.LOGIN_URI,
        TokenRequest(
                username: username,
                password: password,
                clientId: "core_client",
                clientSecret: "secret",
                grantType: "password")
            .toJson(),_header);
  }

  Future<Response> logOut() async {
    return await apiClient.deleteData(AppConstants.LOG_OUT);
  }

  Future<Response> getCurrentUser() async{
    return await apiClient.getDataNewApi(AppConstants.GET_USER);
  }


  Future<String> _saveDeviceToken() async {
    String? _deviceToken = '@';
    if (!GetPlatform.isWeb) {
      try {
        _deviceToken = await FirebaseMessaging.instance.getToken();
      } catch (e) {}
    }
    if (_deviceToken != null) {
      print('--------Device Token---------- ' + _deviceToken);
    }
    return _deviceToken!;
  }

  // for  user token
  Future<bool> saveUserToken(String token) async {
    apiClient.token = "Bearer $token";
    apiClient.updateHeader("Bearer $token", null,
        sharedPreferences.getString(AppConstants.LANGUAGE_CODE) ?? "vi", 0);
    return await sharedPreferences.setString(
        AppConstants.TOKEN, "Bearer $token");
  }
  Future<bool> clearUserToken() async {
    return await sharedPreferences.remove(AppConstants.TOKEN);
  }

  String getUserToken() {
    return sharedPreferences.getString(AppConstants.TOKEN) ?? "";
  }

  bool isLoggedIn() {
    return sharedPreferences.containsKey(AppConstants.TOKEN);
  }

  bool clearSharedAddress() {
    sharedPreferences.remove(AppConstants.USER_ADDRESS);
    return true;
  }

  // for  Remember Email
  Future<void> saveUserNumberAndPassword(
      String number, String password, String countryCode) async {
    try {
      await sharedPreferences.setString(AppConstants.USER_PASSWORD, password);
      await sharedPreferences.setString(AppConstants.USER_NUMBER, number);
      await sharedPreferences.setString(
          AppConstants.USER_COUNTRY_CODE, countryCode);
    } catch (e) {
      throw e;
    }
  }

  Future<void> saveUserNumber(String number, String countryCode) async {
    try {
      await sharedPreferences.setString(AppConstants.USER_NUMBER, number);
      await sharedPreferences.setString(
          AppConstants.USER_COUNTRY_CODE, countryCode);
    } catch (e) {
      throw e;
    }
  }

  String getUserNumber() {
    return sharedPreferences.getString(AppConstants.USER_NUMBER) ?? "";
  }

  String getUserCountryCode() {
    return sharedPreferences.getString(AppConstants.USER_COUNTRY_CODE) ?? "";
  }

  String getUserPassword() {
    return sharedPreferences.getString(AppConstants.USER_PASSWORD) ?? "";
  }

  bool isNotificationActive() {
    return sharedPreferences.getBool(AppConstants.NOTIFICATION) ?? true;
  }

  Future<bool> clearUserNumberAndPassword() async {
    await sharedPreferences.remove(AppConstants.USER_PASSWORD);
    await sharedPreferences.remove(AppConstants.USER_COUNTRY_CODE);
    return await sharedPreferences.remove(AppConstants.USER_NUMBER);
  }
}
