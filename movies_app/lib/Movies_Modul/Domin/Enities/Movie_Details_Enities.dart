import 'package:equatable/equatable.dart';
import 'package:movies_app/Movies_Modul/Domin/Enities/Genres.dart';

class MoviesDetailsEnities  extends Equatable{

  final String? backdropPath;
  final int id;
  final String title;
  final String overview;
  final double voteAverage ;
  final List<GenresEnities> genreIds ;
  final String  releaseDate;
  final int runTime;


  const MoviesDetailsEnities({ this.backdropPath, required this.id, required this.title, required this.overview,
    required this.voteAverage,required  this.genreIds,required this.releaseDate ,required this.runTime});


  @override
  List<Object?> get props => [id,backdropPath,title,overview,voteAverage,genreIds ,releaseDate,runTime] ;

}
