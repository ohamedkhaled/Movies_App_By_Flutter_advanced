import 'package:movies_app/Tv_Modul/Domin/Enities/OnAirEntities.dart';

class OnAirModel extends OnAirEntities {
  const OnAirModel(
      {required super.id, required super.backdropPath, required super.name});

  factory OnAirModel.fromjason(Map<String, dynamic> jasonData) {
    return OnAirModel(
        id: jasonData["id"],
        backdropPath: jasonData["backdrop_path"]??"/igxqysAqY84xQISHbZllwV67JPr.jpg",
        name: jasonData["name"]);
  }
}
