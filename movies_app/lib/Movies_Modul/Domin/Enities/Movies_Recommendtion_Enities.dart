import 'package:equatable/equatable.dart';

class MoviesRecommendtionEnities extends Equatable{

  final String? backdropPath;
  final int id ;

 const MoviesRecommendtionEnities({this.backdropPath ,required this.id});

  @override
  List<Object?> get props => [backdropPath,id];

}