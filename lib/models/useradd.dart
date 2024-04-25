class Useradd {
  String? username;
  String? password;

  Useradd({this.username, this.password});

  factory Useradd.fromJson(Map<String, dynamic> json) {
    return Useradd(username: json['username'], password: json['password']);
  }
}
