import 'dart:convert';

import 'package:get/get.dart';
import 'package:timesheet/data/repository/patient_repo.dart';

import '../data/model/body/medical_record.dart';
import '../data/model/body/patient.dart';

class PatientController extends GetxController implements GetxService{
  final PatientRepo repo;

  List<Patient> listPatient = [];

  MedicalRecord? _record;
  MedicalRecord? get record => _record;

  PatientController({required this.repo});

  Future<int> getPatients(int departmentId) async {
    listPatient.clear();
    Response response = await repo.getPatients(departmentId);
    if(response.statusCode == 200 && response.body['Status'] == 0){
      response.body['DanhSachBenhNhan'].forEach((e) => listPatient.add(Patient.fromJson(e)));
    }
    update();
    return response.body['Status'];
  }

  Future<int> getMedicalRecord(int medicalRecordID) async {
    Response response = await repo.getMedicalRecord(medicalRecordID);
    if(response.statusCode == 200 && response.body['Status'] == 0){
      _record = MedicalRecord.fromJson(response.body);
    }
    update();
    return response.body['Status'];
  }
}