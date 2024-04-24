class Movienotification {
  String? imageURL;
  String? textData1;
  String? textData2;
  String? textData3;

  Movienotification({
    this.imageURL,
    this.textData1,
    this.textData2,
    this.textData3,
  });

  factory Movienotification.fromJson(Map<String, dynamic> json) {
    return Movienotification(
      imageURL: json['imageURL'],
      textData1: json['textData1'],
      textData2: json['textData2'],
      textData3: json['textData3'],
    );
  }
}
