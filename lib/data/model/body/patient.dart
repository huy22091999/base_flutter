class Patient {
  Patient({
    required this.MedicalRecordID,
    required this.VienPhiID,
    required this.BenhAnID,
    required this.PatientName,
    required this.PatientCode,
    required this.GioiTinh,
    required this.Tuoi,
    required this.TuoiMobile,
    required this.DoiTuong,
    required this.SoNgayNamVien,
    required this.ThongTinBN,
    required this.SoThuTu,
    required this.NgayKham,
    required this.ThongTinBH,
    required this.MucHuong,
    required this.Phong,
    required this.Buong,
    required this.Giuong,
    required this.FilterDepartmentID,
    required this.FilterCapCuu,
    required this.FilterUuTien,
    required this.FilterBHYT,
    required this.FilterVienPhi,
    required this.FilterNam,
    required this.FilterNu,
    required this.FilterTEDuoi6Tuoi,
    required this.Icon,
  });
  late final int MedicalRecordID;
  late final int VienPhiID;
  late final int BenhAnID;
  late final String PatientName;
  late final String PatientCode;
  late final String GioiTinh;
  late final String Tuoi;
  late final String TuoiMobile;
  late final String DoiTuong;
  late final int SoNgayNamVien;
  late final String ThongTinBN;
  late final int SoThuTu;
  late final String NgayKham;
  late final String ThongTinBH;
  late final String MucHuong;
  late final String Phong;
  late final String Buong;
  late final String Giuong;
  late final int FilterDepartmentID;
  late final bool FilterCapCuu;
  late final bool FilterUuTien;
  late final bool FilterBHYT;
  late final bool FilterVienPhi;
  late final bool FilterNam;
  late final bool FilterNu;
  late final bool FilterTEDuoi6Tuoi;
  late final String Icon;

  Patient.fromJson(Map<String, dynamic> json){
    MedicalRecordID = json['MedicalRecordID'];
    VienPhiID = json['VienPhiID'];
    BenhAnID = json['BenhAnID'];
    PatientName = json['PatientName'];
    PatientCode = json['PatientCode'];
    GioiTinh = json['GioiTinh'];
    Tuoi = json['Tuoi'];
    TuoiMobile = json['TuoiMobile'];
    DoiTuong = json['DoiTuong'];
    SoNgayNamVien = json['SoNgayNamVien'];
    ThongTinBN = json['ThongTinBN'];
    SoThuTu = json['SoThuTu'];
    NgayKham = json['NgayKham'];
    ThongTinBH = json['ThongTinBH'];
    MucHuong = json['MucHuong'];
    Phong = json['Phong'];
    Buong = json['Buong'];
    Giuong = json['Giuong'];
    FilterDepartmentID = json['Filter_DepartmentID'];
    FilterCapCuu = json['Filter_CapCuu'];
    FilterUuTien = json['Filter_UuTien'];
    FilterBHYT = json['Filter_BHYT'];
    FilterVienPhi = json['Filter_VienPhi'];
    FilterNam = json['Filter_Nam'];
    FilterNu = json['Filter_Nu'];
    FilterTEDuoi6Tuoi = json['Filter_TE_Duoi6Tuoi'];
    Icon = json['Icon'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['MedicalRecordID'] = MedicalRecordID;
    _data['VienPhiID'] = VienPhiID;
    _data['BenhAnID'] = BenhAnID;
    _data['PatientName'] = PatientName;
    _data['PatientCode'] = PatientCode;
    _data['GioiTinh'] = GioiTinh;
    _data['Tuoi'] = Tuoi;
    _data['TuoiMobile'] = TuoiMobile;
    _data['DoiTuong'] = DoiTuong;
    _data['SoNgayNamVien'] = SoNgayNamVien;
    _data['ThongTinBN'] = ThongTinBN;
    _data['SoThuTu'] = SoThuTu;
    _data['NgayKham'] = NgayKham;
    _data['ThongTinBH'] = ThongTinBH;
    _data['MucHuong'] = MucHuong;
    _data['Phong'] = Phong;
    _data['Buong'] = Buong;
    _data['Giuong'] = Giuong;
    _data['Filter_DepartmentID'] = FilterDepartmentID;
    _data['Filter_CapCuu'] = FilterCapCuu;
    _data['Filter_UuTien'] = FilterUuTien;
    _data['Filter_BHYT'] = FilterBHYT;
    _data['Filter_VienPhi'] = FilterVienPhi;
    _data['Filter_Nam'] = FilterNam;
    _data['Filter_Nu'] = FilterNu;
    _data['Filter_TE_Duoi6Tuoi'] = FilterTEDuoi6Tuoi;
    _data['Icon'] = Icon;
    return _data;
  }
}