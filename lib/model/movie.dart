const String tableMovies = 'movies';

class MovieFields {
  static final List<String> values = [
    id, title, posterUrl, director, description, releaseTime, endTime
  ];

  static const String id = '_id';
  static const String title = 'title';
  static const String posterUrl = 'poster_url';
  static const String director = 'director';
  static const String description = 'description';
  static const String releaseTime = 'release_time';
  static const String endTime = 'end_time';
}

class Movie {
  final int? id;
  final String title;
  final String posterUrl;
  final String director;
  final String description;
  final DateTime releaseTime;
  final DateTime endTime;

  const Movie({
    this.id,
    required this.title,
    required this.posterUrl,
    required this.director,
    required this.description,
    required this.releaseTime,
    required this.endTime
  });

  Map<String, Object?> toJson() => {
    MovieFields.id: id,
    MovieFields.title: title,
    MovieFields.posterUrl: posterUrl,
    MovieFields.director: director,
    MovieFields.description: description,
    MovieFields.releaseTime: releaseTime.toIso8601String(),
    MovieFields.endTime: endTime.toIso8601String(),
  };

  static Movie fromJson(Map<String, Object?> json) => Movie(
    id: json[MovieFields.id] as int?,
    title: json[MovieFields.title] as String,
    posterUrl: json[MovieFields.posterUrl] as String,
    director: json[MovieFields.director] as String,
    description: json[MovieFields.description] as String,
    releaseTime: DateTime.parse(json[MovieFields.releaseTime] as String),
    endTime: DateTime.parse(json[MovieFields.endTime] as String)
  );

  Movie copy({
    int? id,
    String? title,
    String? posterUrl,
    String? director,
    String? description,
    DateTime? releaseTime,
    DateTime? endTime,
  }) => Movie(
    id: id ?? this.id,
    title: title ?? this.title,
    posterUrl: title ?? this.posterUrl,
    director: title ?? this.director,
    description: description ?? this.description,
    releaseTime: releaseTime ?? this.releaseTime,
    endTime: releaseTime ?? this.endTime,
  );
}