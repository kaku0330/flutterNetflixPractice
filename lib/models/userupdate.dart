class Userupdate {
  String? username;
  String? password;

  Userupdate({this.username, this.password});

  factory Userupdate.fromJson(Map<String, dynamic> json) {
    return Userupdate(username: json['username'], password: json['password']);
  }
}
