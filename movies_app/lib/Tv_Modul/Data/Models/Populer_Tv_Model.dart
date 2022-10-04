import 'package:movies_app/Tv_Modul/Domin/Enities/Populer_Tv_Entities.dart';

class PopulerTvModel extends PopulerTvEntities {
  PopulerTvModel(
      {required super.id,
      required super.name,
      required super.overview,
      required super.voteAverage,
      required super.firstAirDate,
      super.backdropPath});

  factory PopulerTvModel.fromjason(Map<String, dynamic> jason) {
    return PopulerTvModel(
        backdropPath: jason["backdrop_path"]??"/igxqysAqY84xQISHbZllwV67JPr.jpg",
        id: jason["id"],
        name: jason["name"],
        overview: jason["overview"],
        voteAverage: jason["vote_average"].toDouble(),
        firstAirDate: jason["first_air_date"]);
  }
}
