import 'dart:convert';
import 'package:timesheet/utils/app_constants.dart';
import '../api/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class PatientRepo{
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  PatientRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> getPatients(int departmentId) async {
    String? clientID = sharedPreferences.getString(AppConstants.TOKEN);
    Map<String,dynamic> body = {
      "ClientID" : clientID,
      "DepartmentID" : 0
    };
    Map<String,String> header = {
      "Content-Type" : "application/json; charset=utf-8",
    };
    return await apiClient.postData(AppConstants.PATIENT, jsonEncode(body), header);
  }

  Future<Response> getMedicalRecord(int medicalRecordID) async {
    String? clientID = sharedPreferences.getString(AppConstants.TOKEN);
    Map<String,dynamic> body = {
      "ClientID" : clientID,
      "MedicalRecordID" : medicalRecordID
    };
    Map<String,String> header = {
      "Content-Type" : "application/json; charset=utf-8",
    };
    return await apiClient.postData(AppConstants.RECORD, jsonEncode(body), header);
  }
}