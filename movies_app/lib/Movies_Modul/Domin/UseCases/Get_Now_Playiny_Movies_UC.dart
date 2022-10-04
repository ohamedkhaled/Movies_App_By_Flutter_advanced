import 'package:dartz/dartz.dart';
import 'package:movies_app/Core/Use_Cases/Use_Case_Movies.dart';
import 'package:movies_app/Movies_Modul/Domin/Enities/Movie_Enities.dart';

import '../Repository/Base_Movie_Repository.dart';

class GetPlayingNowMoviesUC extends UseCaseMovies<List<MovieEntities>,NoPrameters> {

  final BaseMovieRepository baseMovieRepository ;

  GetPlayingNowMoviesUC({required this.baseMovieRepository});


  @override
  Future<Either<List<MovieEntities>, Exception>> call(NoPrameters prameters) async {
    return  await baseMovieRepository.getNowPlayingMovies();
  }
}