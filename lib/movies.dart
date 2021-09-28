import 'dart:convert';

class Movies {
  String title;
  String posterPath;
  Movies({required this.title, required this.posterPath});

  String get fullImageURL => "https://image.tmdb.org/t/p/w200$posterPath";

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'poster_path': posterPath,
    };
  }

  factory Movies.fromMap(Map<String, dynamic> map) {
    return Movies(
      title: map['title'],
      posterPath: map['poster_path'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Movies.fromJson(String source) => Movies.fromMap(json.decode(source));
}
