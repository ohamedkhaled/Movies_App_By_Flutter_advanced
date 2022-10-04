import 'package:movies_app/Tv_Modul/Domin/Enities/Seasons_Entities.dart';

class SeasonModel extends SeasonsEntities {
  SeasonModel(
      {required super.seasonNumber,
      required super.airDate,
      required super.episodeCount,
      required super.id,
      required super.name,
      required super.overview,
      required super.posterPath});

  factory SeasonModel.fromjason(Map<String, dynamic> jasonData) {
    return SeasonModel(
        seasonNumber: jasonData["season_number"],
        airDate: jasonData["air_date"],
        episodeCount: jasonData["episode_count"],
        id: jasonData["id"],
        name: jasonData["name"],
        overview: jasonData["overview"],
        posterPath: jasonData["poster_path"]);
  }
}
