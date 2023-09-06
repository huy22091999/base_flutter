import 'dart:async';
import 'dart:convert';

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

  Future<Response> login({required String username, required String password}) async {
    //header login
    Map<String, String> header = {
      'Content-Type': 'application/json',
    };
    return await apiClient.postDataLogin(
        AppConstants.LOGIN_URI,
        TokenRequest(
          Username: username,
          Password: password,
        ).toJson(),
        header);
  }

  Future<Response> logOut() async {
    return await apiClient.deleteData(AppConstants.LOG_OUT);
  }

  Future<Response> getCurrentUser() async{
    String? clientID = sharedPreferences.getString(AppConstants.TOKEN);
    Map<String,String> header = {
      "Content-Type" : "application/json"
    };
    Map<String,String> body = {
      "ClientID" : clientID ?? ''
    };
    return await apiClient.postData(AppConstants.GET_USER,jsonEncode(body),header);
  }


  Future<String> _saveDeviceToken() async {
    String? deviceToken = '@';
    if (!GetPlatform.isWeb) {
      try {
        deviceToken = await FirebaseMessaging.instance.getToken();
      } catch (e) {}
    }
    if (deviceToken != null) {
      print('--------Device Token---------- ' + deviceToken);
    }
    return deviceToken!;
  }

  // for  user token
  Future<bool> saveUserToken(String token) async {
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
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
