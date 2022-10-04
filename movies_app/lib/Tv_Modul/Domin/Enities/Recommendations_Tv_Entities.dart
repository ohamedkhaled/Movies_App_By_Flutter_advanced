
import 'package:equatable/equatable.dart';

class RecommendationsTvEntities extends Equatable{

  final String? backdropPath;
  final  int   id ;


  RecommendationsTvEntities({this.backdropPath, required this.id});


  @override
  List<Object?> get props => [backdropPath,id];
}