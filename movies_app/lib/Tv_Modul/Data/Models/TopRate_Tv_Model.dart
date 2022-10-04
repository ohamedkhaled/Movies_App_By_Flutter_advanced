
import 'package:movies_app/Tv_Modul/Domin/Enities/TopRate_Tv_Entities.dart';

class TopRateTvModel extends TopRateTvEntities {




  TopRateTvModel(
  {required super.id,
  required super.name,
  required super.overview,
  required super.voteAverage,
  required super.firstAirDate,
  super.backdropPath});

factory TopRateTvModel.fromjason(Map<String, dynamic> jason) {

return TopRateTvModel(
backdropPath: jason["backdrop_path"]??"/igxqysAqY84xQISHbZllwV67JPr.jpg",
id: jason["id"],
name: jason["name"],
overview: jason["overview"],
voteAverage: jason["vote_average"].toDouble(),
firstAirDate: jason["first_air_date"]);
}
}
