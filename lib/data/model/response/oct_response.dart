
import 'asset_info.dart';

class OctResponse {

  late final int code;
  late final String message;
  late final String timestamp;
  late final int total;
  late final List<dynamic> data;

  OctResponse({required this.code, required this.message, required this.timestamp, required this.total, required this.data});

  OctResponse.fromJson(Map<String,dynamic> json){
    code = json['code'];
    message = json['message'];
    timestamp = json['timestamp'];
    total = json['total'];
    data = List.castFrom<dynamic, dynamic>(json['data']);
  }
}