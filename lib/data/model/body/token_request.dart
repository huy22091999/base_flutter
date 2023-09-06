class TokenRequest {
  String? Username;
  String? Password;

  TokenRequest(
      {this.Username,
      this.Password,});

  TokenRequest.fromJson(Map<String, dynamic> json) {
    Username = json['username'];
    Password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = Username;
    data['password'] = Password;
    return data;
  }
}
