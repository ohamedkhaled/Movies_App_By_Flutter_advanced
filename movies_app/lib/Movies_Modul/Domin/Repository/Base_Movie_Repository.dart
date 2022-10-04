import 'package:dartz/dartz.dart';
import 'package:movies_app/Movies_Modul/Domin/Enities/Movie_Details_Enities.dart';
import 'package:movies_app/Movies_Modul/Domin/Enities/Movie_Enities.dart';
import 'package:movies_app/Movies_Modul/Domin/Enities/Movies_More_Entities.dart';
import 'package:movies_app/Movies_Modul/Domin/Enities/Movies_Recommendtion_Enities.dart';

abstract class BaseMovieRepository {


  Future<Either< List<MovieEntities>,Exception>> getNowPlayingMovies();
  Future<Either< List<MovieEntities>,Exception>> getPopulerMovies();
  Future<Either< List<MovieEntities>,Exception>> getTopRateMovies();
  Future<Either<MoviesDetailsEnities,Exception>> getDetailsMovies( int id );
  Future<Either< List<MoviesRecommendtionEnities>,Exception>> getRecommendtionMovies( int id );
  Future<Either<List< MoviesMoreEntities>,Exception>> getPopulerMoviesMore ();
  Future<Either<List< MoviesMoreEntities>,Exception>> getTopRateMoviesMore ();


}