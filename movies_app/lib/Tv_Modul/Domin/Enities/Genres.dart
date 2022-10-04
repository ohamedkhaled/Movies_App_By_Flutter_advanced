import 'package:equatable/equatable.dart';

class GenresEntitiesTv extends Equatable{

  final int id;
  final String type;

 const GenresEntitiesTv({required this.id, required this.type});

  @override
  List<Object?> get props => [id,type];
}