import 'package:movies_app/Movies_Modul/Domin/Enities/Movie_Enities.dart';

class MoviesModel extends MovieEntities {
  const MoviesModel(
      {required super.backdropPath,
      required super.id,
      required super.title,
      required super.overview,
      required super.voteAverage,
      required super.genreIds,
      required super.releaseDate});

  factory MoviesModel.fromjason(Map<String, dynamic> jason) {

    return MoviesModel(
        backdropPath: jason["backdrop_path"],
        id: jason["id"],
        title: jason["title"],
        overview: jason["overview"],
        voteAverage: jason["vote_average"].toDouble(),
        genreIds: List<int>.from(jason["genre_ids"].map((e) => e)),
        releaseDate: jason["release_date"]);
  }

}
