import 'package:movies_app/Tv_Modul/Domin/Enities/Episodes_Entities.dart';

class EpisodesTvModel extends EpisodesEntities {
  EpisodesTvModel(
      {required super.id,
      required super.name,
      required super.overview,
      required super.firstAirDate,
      super.stillPath});

  factory EpisodesTvModel.fromjason(Map<String, dynamic> jasonData) {

    return EpisodesTvModel(
        id: jasonData["id"],
        name: jasonData["name"],
        overview: jasonData["overview"],
        stillPath: jasonData["still_path"] ?? "/wlHuWQcnLbotcVIZS3XRyp37hk.jpg",
        firstAirDate: jasonData["air_date"]);
  }
}
