import 'package:equatable/equatable.dart';

class PopulerTvEntities extends  Equatable{

  final String? backdropPath;
  final int id;
  final String name;
  final String overview;
  final double voteAverage ;
  final String  firstAirDate;


  const PopulerTvEntities({ this.backdropPath, required this.id, required this.name, required this.overview,
    required this.voteAverage,required this.firstAirDate });


  @override
  List<Object?> get props => [id,backdropPath,name,overview,voteAverage,firstAirDate] ;

}