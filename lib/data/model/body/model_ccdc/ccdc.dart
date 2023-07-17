import 'package:timesheet/data/model/body/model_ccdc/data.dart';
import 'package:timesheet/data/model/response/asset_info.dart';

class CCDC {
  String? timestamp;
  int? code;
  String? message;
  String? apiSubErrors;
  Data? data;
  int? total;

  CCDC({this.timestamp, this.code, this.message, this.apiSubErrors, this.data,
    this.total});

  CCDC.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    code = json['code'];
    message = json['message'];
    apiSubErrors = json['apiSubErrors'];
    total = json['total'];
    data = Data.fromJson(json['data']);
  }
  Map<String,dynamic> toJson(){
    return{
      'timestamp':timestamp,
      'code':code,
      'message':message,
      'apiSubErrors':apiSubErrors,
      'data':data!.toJson(),
      'total':total
    };
  }
}
class ResponseAssetInfo {
  String? timestamp;
  int? code;
  String? message;
  String? apiSubErrors;
  AssetInfo? data;
  int? total;

  ResponseAssetInfo({this.timestamp, this.code, this.message, this.apiSubErrors, this.data,
    this.total});

  ResponseAssetInfo.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    code = json['code'];
    message = json['message'];
    apiSubErrors = json['apiSubErrors'];
    total = json['total'];
    data = AssetInfo.fromJson(json['data']);
  }
  Map<String,dynamic> toJson(){
    return{
      'timestamp':timestamp,
      'code':code,
      'message':message,
      'apiSubErrors':apiSubErrors,
      'data':data!.toJson(),
      'total':total
    };
  }
}

