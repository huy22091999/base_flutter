class TokenResponsive {
  int? Status;
  String? Message;
  String? ClientID;

  TokenResponsive(
      {this.Status,
      this.Message,
      this.ClientID,});

  TokenResponsive.fromJson(Map<String, dynamic> json) {
    Status = json['Status'];
    Message = json['Message'];
    ClientID = json['ClientID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Status'] = Status;
    data['Message'] = Message;
    data['ClientID'] = ClientID;
    return data;
  }
}
