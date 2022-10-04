
import 'package:equatable/equatable.dart';

abstract class MoviesMoreEvent extends Equatable{

  const MoviesMoreEvent();

  List<Object?> get props => [];
}

class GetMorePopulerMovies extends MoviesMoreEvent{}

