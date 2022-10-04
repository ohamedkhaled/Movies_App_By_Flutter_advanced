
import 'package:equatable/equatable.dart';

abstract class MovieDetailsEvent extends Equatable{

  const MovieDetailsEvent();

}

class GetMovieDetailsEvent extends MovieDetailsEvent{
    final int id ;

    GetMovieDetailsEvent({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id];

}

class GetMoviesRecommendtionEvent extends MovieDetailsEvent{
   final int id ;

   GetMoviesRecommendtionEvent({required this.id});

  @override

  List<Object?> get props => [id];

}