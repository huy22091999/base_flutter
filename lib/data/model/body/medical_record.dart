class MedicalRecord {
  MedicalRecord({
    required this.Status,
    required this.MedicalRecordID,
    required this.VienPhiID,
    required this.BenhAnID,
    required this.MaBenhAn,
    required this.PatientCode,
    required this.PatientName,
    required this.GioiTinh,
    required this.Tuoi,
    required this.TuoiSimple,
    required this.NgaySinh,
    required this.DanToc,
    required this.QuocTich,
    required this.NgheNghiep,
    required this.DoiTuong,
    required this.DiaChi,
    required this.ThongTinBH,
    required this.FilterBHYT,
    required this.FilterVienPhi,
    required this.MucHuong,
    required this.IsChoKham,
    required this.DonTiepLuc,
    required this.LoaiDonTiep,
    required this.DoiTuongDonTiep,
    required this.LyDoKham,
    required this.SoVaoVien,
    required this.SoVaoKhoa,
    required this.TenBenhAn,
    required this.BacSiKham,
    required this.DieuDuong,
    required this.NgayVao,
    required this.NgayRa,
    required this.KhoaPhong,
    this.XuTri,
    required this.ChanDoan,
    required this.ListReport,
    required this.ListLichSu,
    required this.ListTab,
  });
  late final int Status;
  late final int MedicalRecordID;
  late final int VienPhiID;
  late final int BenhAnID;
  late final String MaBenhAn;
  late final String PatientCode;
  late final String PatientName;
  late final String GioiTinh;
  late final String Tuoi;
  late final String TuoiSimple;
  late final String NgaySinh;
  late final String DanToc;
  late final String QuocTich;
  late final String NgheNghiep;
  late final String DoiTuong;
  late final String DiaChi;
  late final String ThongTinBH;
  late final bool FilterBHYT;
  late final bool FilterVienPhi;
  late final String MucHuong;
  late final bool IsChoKham;
  late final String DonTiepLuc;
  late final String LoaiDonTiep;
  late final String DoiTuongDonTiep;
  late final String LyDoKham;
  late final String SoVaoVien;
  late final String SoVaoKhoa;
  late final String TenBenhAn;
  late final String BacSiKham;
  late final String DieuDuong;
  late final String NgayVao;
  late final String NgayRa;
  late final String KhoaPhong;
  late final Null XuTri;
  late final String ChanDoan;
  late final List<Report> ListReport;
  late final List<LichSu> ListLichSu;
  late final List<Tab> ListTab;

  MedicalRecord.fromJson(Map<String, dynamic> json){
    Status = json['Status'];
    MedicalRecordID = json['MedicalRecordID'];
    VienPhiID = json['VienPhiID'];
    BenhAnID = json['BenhAnID'];
    MaBenhAn = json['MaBenhAn'];
    PatientCode = json['PatientCode'];
    PatientName = json['PatientName'];
    GioiTinh = json['GioiTinh'];
    Tuoi = json['Tuoi'];
    TuoiSimple = json['TuoiSimple'];
    NgaySinh = json['NgaySinh'];
    DanToc = json['DanToc'];
    QuocTich = json['QuocTich'];
    NgheNghiep = json['NgheNghiep'];
    DoiTuong = json['DoiTuong'];
    DiaChi = json['DiaChi'];
    ThongTinBH = json['ThongTinBH'];
    FilterBHYT = json['Filter_BHYT'];
    FilterVienPhi = json['Filter_VienPhi'];
    MucHuong = json['MucHuong'];
    IsChoKham = json['IsChoKham'];
    DonTiepLuc = json['DonTiepLuc'];
    LoaiDonTiep = json['LoaiDonTiep'];
    DoiTuongDonTiep = json['DoiTuongDonTiep'];
    LyDoKham = json['LyDoKham'];
    SoVaoVien = json['SoVaoVien'];
    SoVaoKhoa = json['SoVaoKhoa'];
    TenBenhAn = json['TenBenhAn'];
    BacSiKham = json['BacSiKham'];
    DieuDuong = json['DieuDuong'];
    NgayVao = json['NgayVao'];
    NgayRa = json['NgayRa'];
    KhoaPhong = json['KhoaPhong'];
    XuTri = null;
    ChanDoan = json['ChanDoan'];
    ListReport = List.from(json['ListReport']).map((e)=>Report.fromJson(e)).toList();
    ListLichSu = List.from(json['ListLichSu']).map((e)=>LichSu.fromJson(e)).toList();
    ListTab = List.from(json['ListTab']).map((e)=>Tab.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Status'] = Status;
    _data['MedicalRecordID'] = MedicalRecordID;
    _data['VienPhiID'] = VienPhiID;
    _data['BenhAnID'] = BenhAnID;
    _data['MaBenhAn'] = MaBenhAn;
    _data['PatientCode'] = PatientCode;
    _data['PatientName'] = PatientName;
    _data['GioiTinh'] = GioiTinh;
    _data['Tuoi'] = Tuoi;
    _data['TuoiSimple'] = TuoiSimple;
    _data['NgaySinh'] = NgaySinh;
    _data['DanToc'] = DanToc;
    _data['QuocTich'] = QuocTich;
    _data['NgheNghiep'] = NgheNghiep;
    _data['DoiTuong'] = DoiTuong;
    _data['DiaChi'] = DiaChi;
    _data['ThongTinBH'] = ThongTinBH;
    _data['Filter_BHYT'] = FilterBHYT;
    _data['Filter_VienPhi'] = FilterVienPhi;
    _data['MucHuong'] = MucHuong;
    _data['IsChoKham'] = IsChoKham;
    _data['DonTiepLuc'] = DonTiepLuc;
    _data['LoaiDonTiep'] = LoaiDonTiep;
    _data['DoiTuongDonTiep'] = DoiTuongDonTiep;
    _data['LyDoKham'] = LyDoKham;
    _data['SoVaoVien'] = SoVaoVien;
    _data['SoVaoKhoa'] = SoVaoKhoa;
    _data['TenBenhAn'] = TenBenhAn;
    _data['BacSiKham'] = BacSiKham;
    _data['DieuDuong'] = DieuDuong;
    _data['NgayVao'] = NgayVao;
    _data['NgayRa'] = NgayRa;
    _data['KhoaPhong'] = KhoaPhong;
    _data['XuTri'] = XuTri;
    _data['ChanDoan'] = ChanDoan;
    _data['ListReport'] = ListReport.map((e)=>e.toJson()).toList();
    _data['ListLichSu'] = ListLichSu.map((e)=>e.toJson()).toList();
    _data['ListTab'] = ListTab.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Report {
  Report({
    required this.Name,
    required this.ReportTypeID,
    required this.ReportID,
    required this.Visible,
  });
  late final String Name;
  late final int ReportTypeID;
  late final int ReportID;
  late final bool Visible;

  Report.fromJson(Map<String, dynamic> json){
    Name = json['Name'];
    ReportTypeID = json['ReportTypeID'];
    ReportID = json['ReportID'];
    Visible = json['Visible'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Name'] = Name;
    _data['ReportTypeID'] = ReportTypeID;
    _data['ReportID'] = ReportID;
    _data['Visible'] = Visible;
    return _data;
  }
}

class LichSu {
  LichSu({
    required this.ID,
    required this.Icon,
    required this.NgayVao,
    required this.HinhThucVao,
    required this.KhoaPhong,
    required this.NgayRa,
    required this.XuTri,
    required this.BacSi,
    required this.Dich,
    required this.ChanDoan,
  });
  late final int ID;
  late final String Icon;
  late final String NgayVao;
  late final String HinhThucVao;
  late final String KhoaPhong;
  late final String NgayRa;
  late final String? XuTri;
  late final String BacSi;
  late final String Dich;
  late final String ChanDoan;

  LichSu.fromJson(Map<String, dynamic> json){
    ID = json['ID'];
    Icon = json['Icon'];
    NgayVao = json['NgayVao'];
    HinhThucVao = json['HinhThucVao'];
    KhoaPhong = json['KhoaPhong'];
    NgayRa = json['NgayRa'];
    XuTri = json['XuTri'];
    BacSi = json['BacSi'];
    Dich = json['Dich'];
    ChanDoan = json['ChanDoan'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ID'] = ID;
    _data['Icon'] = Icon;
    _data['NgayVao'] = NgayVao;
    _data['HinhThucVao'] = HinhThucVao;
    _data['KhoaPhong'] = KhoaPhong;
    _data['NgayRa'] = NgayRa;
    _data['XuTri'] = XuTri;
    _data['BacSi'] = BacSi;
    _data['Dich'] = Dich;
    _data['ChanDoan'] = ChanDoan;
    return _data;
  }
}

class Tab {
  Tab({
    required this.Name,
    required this.ID,
    required this.Active,
  });
  late final String Name;
  late final String ID;
  late final String Active;

  Tab.fromJson(Map<String, dynamic> json){
    Name = json['Name'];
    ID = json['ID'];
    Active = json['Active'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Name'] = Name;
    _data['ID'] = ID;
    _data['Active'] = Active;
    return _data;
  }
}