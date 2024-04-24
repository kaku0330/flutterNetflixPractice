class Moviesearch {
  String? title;
  String? imageURL;

  Moviesearch({
    this.title,
    this.imageURL,
  });

  factory Moviesearch.fromJson(Map<String, dynamic> json) {
    return Moviesearch(
      title: json['title'],
      imageURL: json['imageURL'],
    );
  }
}
