
import 'package:equatable/equatable.dart';


class OnAirEntities extends Equatable{

  final  String? backdropPath ;
  final String name;
  final int id;


  const OnAirEntities({required this.id, this.backdropPath ,required this.name});


  @override
  List<Object?> get props => [backdropPath,name,id];


}