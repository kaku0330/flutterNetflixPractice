class Usercount {
  bool row;

  Usercount({
    this.row = false,
  });

  factory Usercount.fromJson(Map<String, dynamic> json) {
    return Usercount(row: json['row']);
  }
}
