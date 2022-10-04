import 'package:equatable/equatable.dart';

class MovieEntities extends Equatable {


  final String backdropPath;
  final int id;
  final String title;
  final String overview;
  final double voteAverage ;
  final List<int> genreIds ;
  final String  releaseDate;

 const MovieEntities({required this.backdropPath, required this.id, required this.title, required this.overview,
      required this.voteAverage,required  this.genreIds,required this.releaseDate});



  @override
  List<Object> get props => [id,backdropPath,title,overview,voteAverage,genreIds,releaseDate];

}