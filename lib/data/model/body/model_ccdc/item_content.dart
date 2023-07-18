import 'assets_voucher.dart';

class ItemContent{
  String? id;
  int? issueDate;
  String? name;
  String? code;
  List<int>? createDate;
  String? createdByDepartment;
  bool? isOwner;
  String? allocationStatusId;
  int? allocationStatusIndex;
  String? handoverPersonName;
  String? handoverDepartmentId;
  String? handoverDepartmentName;
  String? handoverDepartmentCode;
  String? receiverPersonName;
  String? receiverDepartmentId;
  String? receiverDepartmentName;
  String? receiverDepartmentCode;
  List<AssetsVoucher>? assetVouchers;
  String? documents;

  ItemContent(
      this.id,
      this.issueDate,
      this.name,
      this.code,
      this.createDate,
      this.createdByDepartment,
      this.isOwner,
      this.allocationStatusId,
      this.allocationStatusIndex,
      this.handoverPersonName,
      this.handoverDepartmentId,
      this.handoverDepartmentName,
      this.handoverDepartmentCode,
      this.receiverPersonName,
      this.receiverDepartmentId,
      this.receiverDepartmentName,
      this.receiverDepartmentCode,
      this.assetVouchers,
      this.documents);

  ItemContent.fromJson(Map<String,dynamic> json){
    List<dynamic> list = json['assetVouchers'] ?? [];
    assetVouchers = list.map((item) => AssetsVoucher.fromJson(item)).toList();
    List<dynamic> listDate = json['createDate']??[];
    List<int> createDates = listDate.cast<int>().toList();
    id = json['id'];
    issueDate = json['issueDate'];
    name = json['name'];
    code = json['code'];
    createDate = createDates;
    createdByDepartment = json['createdByDepartment'];
    isOwner = json['isOwner'];
    allocationStatusId = json['allocationStatusId'];
    allocationStatusIndex = json['allocationStatusIndex'];
    handoverPersonName = json['handoverPersonName'];
    handoverDepartmentCode = json['handoverDepartmentCode'];
    handoverDepartmentName = json['handoverDepartmentName'];
    receiverPersonName = json['receiverPersonName'];
    receiverDepartmentId = json['receiverDepartmentId'];
    receiverDepartmentName = json['receiverDepartmentName'];
    receiverDepartmentCode = json['receiverDepartmentCode'];
    documents = json['documents'];
  }
}
