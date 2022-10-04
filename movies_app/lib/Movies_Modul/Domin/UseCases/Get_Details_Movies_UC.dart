import 'package:dartz/dartz.dart';
import 'package:movies_app/Core/Use_Cases/Use_Case_Movies.dart';
import 'package:movies_app/Movies_Modul/Domin/Enities/Movie_Details_Enities.dart';

import '../Repository/Base_Movie_Repository.dart';

class GetDetailsMoviesUC extends UseCaseMovies< MoviesDetailsEnities,int>{


 final  BaseMovieRepository baseMovieRepository ;

  GetDetailsMoviesUC({ required this.baseMovieRepository});

  @override
  Future<Either<MoviesDetailsEnities, Exception>> call(int parameter) async {

      final result = await baseMovieRepository.getDetailsMovies(parameter);
      return result ;
  }
}



// for more parameters>>>>>>>>>>
//
// class MoviesDetailsPrameters extends Equatable{
//
//    final int pr1 ;
//    final int pr2 ;
//    const MoviesDetailsPrameters({required this.pr1 ,required this.pr2});
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => throw UnimplementedError();
//
// }