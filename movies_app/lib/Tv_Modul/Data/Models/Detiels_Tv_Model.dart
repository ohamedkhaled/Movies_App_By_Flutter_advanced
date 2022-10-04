import 'package:movies_app/Movies_Modul/Data/Models/Genres_Model.dart';
import 'package:movies_app/Tv_Modul/Data/Models/Season_Model.dart';
import 'package:movies_app/Tv_Modul/Domin/Enities/Details_Tv.dart';

import 'Genres_Tv_Model.dart';

class DetielsTvModel extends DetielsTv {
  DetielsTvModel(
      {required super.seasons,
       super.backdropPath,
      required super.name,
      required super.firstAirDate,
      required super.overView,
      required super.voteAverage,
      required super.id,
      required super.genres,
      required super.episodeRunTime,
      required super.numberOfSeasons});

  factory DetielsTvModel.fromjason(Map<String, dynamic> jasonData) {
    return DetielsTvModel(
        backdropPath: jasonData["backdrop_path"]??"",
        name: jasonData["name"],
        id: jasonData["id"],
        firstAirDate: jasonData["first_air_date"],
        overView: jasonData["overview"],
        voteAverage: jasonData["vote_average"],
        episodeRunTime:
            List<int>.from(jasonData["episode_run_time"].map((e) => e)),
        numberOfSeasons: jasonData["number_of_seasons"],
        genres: List<GenresTvModel>.from(
            jasonData["genres"].map((e) => GenresTvModel.fromjason(e))),
        seasons: List<SeasonModel>.from(
            jasonData["seasons"].map((e) => SeasonModel.fromjason(e))));
  }
}
