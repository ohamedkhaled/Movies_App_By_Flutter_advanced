import 'package:equatable/equatable.dart';

class MoviesMoreEntities  extends Equatable{

  final String? backdropPath;
  final int id;
  final String title;
  final String overview;
  final double voteAverage ;
  final String  releaseDate;


  const MoviesMoreEntities({ this.backdropPath, required this.id, required this.title, required this.overview,
    required this.voteAverage,required this.releaseDate });


  @override
  List<Object?> get props => [id,backdropPath,title,overview,voteAverage,releaseDate] ;

}