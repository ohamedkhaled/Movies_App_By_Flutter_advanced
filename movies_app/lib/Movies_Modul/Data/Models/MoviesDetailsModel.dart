import 'package:movies_app/Movies_Modul/Data/Models/Genres_Model.dart';
import 'package:movies_app/Movies_Modul/Domin/Enities/Genres.dart';
import 'package:movies_app/Movies_Modul/Domin/Enities/Movie_Details_Enities.dart';

class MoviesDetailsModel extends MoviesDetailsEnities {
  MoviesDetailsModel(
      { super.backdropPath,
      required super.id,
      required super.title,
      required super.overview,
      required super.voteAverage,
      required super.genreIds,
      required super.releaseDate,
      required super.runTime
});


factory MoviesDetailsModel.fromjason(Map<String, dynamic> jason) {
return MoviesDetailsModel(
backdropPath: jason["backdrop_path"]??"/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg",
id: jason["id"],
title: jason["title"],
overview: jason["overview"],
voteAverage: jason["vote_average"].toDouble(),
genreIds: List<GenresModel>.from(jason["genres"].map((e) => GenresModel.fromjason(e))),
releaseDate: jason["release_date"],
runTime: jason["runtime"]
);
}
}
