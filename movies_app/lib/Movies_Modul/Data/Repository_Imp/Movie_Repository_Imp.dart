import 'package:dartz/dartz.dart';
import 'package:movies_app/Movies_Modul/Data/DataSource/Movie_Remote_DataResourc.dart';
import 'package:movies_app/Movies_Modul/Domin/Enities/Movie_Details_Enities.dart';
import 'package:movies_app/Movies_Modul/Domin/Enities/Movie_Enities.dart';
import 'package:movies_app/Movies_Modul/Domin/Enities/Movies_More_Entities.dart';
import 'package:movies_app/Movies_Modul/Domin/Enities/Movies_Recommendtion_Enities.dart';
import 'package:movies_app/Movies_Modul/Domin/Repository/Base_Movie_Repository.dart';

class MoviesRepository implements BaseMovieRepository{
  final BaseMovieRemoteDataResourc baseMovieRemoteDataResourc ;

  MoviesRepository({required this.baseMovieRemoteDataResourc});

  @override
  Future<Either<List<MovieEntities>,Exception>> getNowPlayingMovies() async{
  try{
    return  Left( await baseMovieRemoteDataResourc.getMoviesPlayingNow());
  }catch(e){
    print(e.toString());
    return Right(Exception(e.toString()));
  }
  }
  @override
  Future<Either<List<MovieEntities>, Exception>> getPopulerMovies() async {
    try{
      return  Left( await baseMovieRemoteDataResourc.getMoviesPopuler());
    }catch(e){
    return Right(Exception(e.toString()));
    }
  }

  @override
  Future<Either<List<MovieEntities>, Exception>> getTopRateMovies() async {
    try{
      return  Left( await baseMovieRemoteDataResourc.getMoviesTopRate());
    }catch(e){
    return Right(Exception(e.toString()));
    }
  }

  @override
  Future<Either<MoviesDetailsEnities, Exception>> getDetailsMovies( int id ) async {
    try{
      return  Left( await baseMovieRemoteDataResourc.getMovieDetails(id));
    }catch(e){
    return Right(Exception(e.toString()));
    }
  }

  @override
  Future<Either<List<MoviesRecommendtionEnities>, Exception>> getRecommendtionMovies(int id) async{
    try{
      return  Left( await baseMovieRemoteDataResourc.getMoviesRecommendtion(id) );
    }catch(e){
    return Right(Exception(e.toString()));
    }
  }

  @override
  Future<Either<List<MoviesMoreEntities>, Exception>> getPopulerMoviesMore() async{
    try{
      return  Left( await baseMovieRemoteDataResourc.getPopulerMoviesMore());
    }catch(e){
    return Right(Exception(e.toString()));
    }
  }

  @override
  Future<Either<List<MoviesMoreEntities>, Exception>> getTopRateMoviesMore() async {
    try{
      return  Left( await baseMovieRemoteDataResourc.getTopRateMoviesMore());
    }catch(e){
    return Right(Exception(e.toString()));
    }
  }





}