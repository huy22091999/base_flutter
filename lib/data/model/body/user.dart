class User {
  int? status;
  String? userName;
  String? email;
  String? khoaPhong;
  List<MListModule>? mListModule;

  User(
      {this.status,
        this.userName,
        this.email,
        this.khoaPhong,
        this.mListModule});

  User.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    userName = json['UserName'];
    email = json['Email'];
    khoaPhong = json['KhoaPhong'];
    if (json['mListModule'] != null) {
      mListModule = <MListModule>[];
      json['mListModule'].forEach((v) {
        mListModule!.add(MListModule.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Status'] = status;
    data['UserName'] = userName;
    data['Email'] = email;
    data['KhoaPhong'] = khoaPhong;
    if (mListModule != null) {
      data['mListModule'] = mListModule!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MListModule {
  int? iD;
  String? page;
  String? name;
  String? icon;

  MListModule({this.iD, this.page, this.name, this.icon});

  MListModule.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    page = json['Page'];
    name = json['Name'];
    icon = json['Icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['Page'] = page;
    data['Name'] = name;
    data['Icon'] = icon;
    return data;
  }
}
