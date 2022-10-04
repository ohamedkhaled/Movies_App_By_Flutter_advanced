import 'package:movies_app/Tv_Modul/Domin/Enities/Recommendations_Tv_Entities.dart';

class RecommendationsTvModel extends RecommendationsTvEntities{


  RecommendationsTvModel({required super.backdropPath, required super.id});



factory RecommendationsTvModel.fromJason( Map<String,dynamic> jasonData){
  return RecommendationsTvModel(
     backdropPath: jasonData["backdrop_path"]??"/igxqysAqY84xQISHbZllwV67JPr.jpg",
     id:  jasonData["id"],
  );
}
}