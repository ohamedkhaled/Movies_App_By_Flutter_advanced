
import 'package:movies_app/Movies_Modul/Domin/Enities/Movies_Recommendtion_Enities.dart';

class MoviesRecommendtionModel extends MoviesRecommendtionEnities{

  const MoviesRecommendtionModel({ super.backdropPath, required super.id});


 factory MoviesRecommendtionModel.fromjason(Map<String,dynamic> jasonData ){

   return MoviesRecommendtionModel(backdropPath: jasonData["backdrop_path"]??"/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg",
  id: jasonData["id"]
);
}


}