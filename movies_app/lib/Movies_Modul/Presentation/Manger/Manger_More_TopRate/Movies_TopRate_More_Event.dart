import 'package:equatable/equatable.dart';

abstract class MoviesTopRateMoreEvent extends Equatable{

  const MoviesTopRateMoreEvent();

  List<Object?> get props => [];
}

class GetMoreTopRateMovies extends MoviesTopRateMoreEvent{}