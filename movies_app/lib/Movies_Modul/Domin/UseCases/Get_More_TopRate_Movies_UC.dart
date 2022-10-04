
import 'package:dartz/dartz.dart';
import 'package:movies_app/Core/Use_Cases/Use_Case_Movies.dart';
import 'package:movies_app/Movies_Modul/Domin/Enities/Movies_More_Entities.dart';
import 'package:movies_app/Movies_Modul/Domin/Repository/Base_Movie_Repository.dart';

class GetMoreTopRateMoviesUC extends UseCaseMovies<List<MoviesMoreEntities>,NoPrameters>{
  final BaseMovieRepository baseMovieRepository ;

  GetMoreTopRateMoviesUC({required this.baseMovieRepository});
  @override
  Future<Either<List<MoviesMoreEntities>, Exception>> call(NoPrameters parameter) async {
   final result =await baseMovieRepository.getTopRateMoviesMore();
   return result ;
  }
}