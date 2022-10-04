import 'package:equatable/equatable.dart';

class EpisodesEntities extends Equatable{

  final int id;
  final String? stillPath ;
  final String name ;
  final String overview;
  final String firstAirDate;

  EpisodesEntities(
      {required this.id,
       this.stillPath,
      required this.name,
      required this.overview,
      required this.firstAirDate});

  @override
  List<Object?> get props => [id,stillPath,name,overview,firstAirDate];

}