import 'package:equatable/equatable.dart';

class GenresEnities extends Equatable {

  final int id ;
  final String name ;
  const GenresEnities({required this.id ,required this.name});

  @override

  List<Object?> get props => [id,name];

}