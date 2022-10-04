import 'package:dartz/dartz.dart';
import 'package:movies_app/Core/Use_Cases/Use_Case_Movies.dart';
import 'package:movies_app/Movies_Modul/Domin/Enities/Movies_Recommendtion_Enities.dart';
import 'package:movies_app/Movies_Modul/Domin/Repository/Base_Movie_Repository.dart';

class GetRecommendtionMoviesUC extends UseCaseMovies<List<MoviesRecommendtionEnities>,int> {


 final  BaseMovieRepository baseMovieRepository ;

 GetRecommendtionMoviesUC({required this.baseMovieRepository});

  @override
  Future<Either<List<MoviesRecommendtionEnities>, Exception>> call(int id) async {
    return await baseMovieRepository.getRecommendtionMovies(id);
  }




}