class ServeyGet {
  List servey;
  int? count;
  ServeyGet({List? servey, this.count}) : this.servey = servey ?? [];

  factory ServeyGet.fromJson(Map<String, dynamic> json) {
    return ServeyGet(
      servey: json['servey'],
      count: json['count'],
    );
  }
}
