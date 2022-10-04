import 'package:movies_app/Movies_Modul/Domin/Enities/Movies_More_Entities.dart';

class MoviesMoreModel extends MoviesMoreEntities {
  MoviesMoreModel(
      {required super.id,
      required super.title,
      required super.overview,
      required super.voteAverage,
      required super.releaseDate,
      super.backdropPath});

  factory MoviesMoreModel.fromjason(Map<String, dynamic> jason) {
    return MoviesMoreModel(
        backdropPath: jason["backdrop_path"],
        id: jason["id"],
        title: jason["title"],
        overview: jason["overview"],
        voteAverage: jason["vote_average"].toDouble(),
        releaseDate: jason["release_date"]);
  }
}
