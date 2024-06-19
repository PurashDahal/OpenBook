// models/book.dart

class Book {
  final String webver;
  final String textver;
  final String imglink;
  final String name;
  final String genre;
  final String lang;

  Book({
    required this.webver,
    required this.textver,
    required this.imglink,
    required this.name,
    required this.genre,
    required this.lang,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      webver: json['webver'],
      textver: json['textver'],
      imglink: json['imglink'],
      name: json['name'],
      genre: json['genre'],
      lang: json['lang'],
    );
  }
}
