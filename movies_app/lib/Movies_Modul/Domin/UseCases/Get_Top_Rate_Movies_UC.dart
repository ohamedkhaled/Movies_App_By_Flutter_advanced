import 'package:dartz/dartz.dart';
import 'package:movies_app/Core/Use_Cases/Use_Case_Movies.dart';

import '../Enities/Movie_Enities.dart';
import '../Repository/Base_Movie_Repository.dart';

class GetTopRateMoviesUC extends UseCaseMovies<List<MovieEntities>,NoPrameters> {

  final BaseMovieRepository baseMovieRepository ;

  GetTopRateMoviesUC({required this.baseMovieRepository});


  @override
  Future<Either<List<MovieEntities>, Exception>> call(NoPrameters prameters) async {
    return await baseMovieRepository.getTopRateMovies();
  }
}