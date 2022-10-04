import 'package:equatable/equatable.dart';
import 'package:movies_app/Movies_Modul/Domin/Enities/Movie_Details_Enities.dart';
import 'package:movies_app/Movies_Modul/Domin/Enities/Movie_Enities.dart';

import '../../../../Core/utils/enums.dart';



class MovieStates extends Equatable {
  final List<MovieEntities> MoviesPlayNow;
  final RequestState MoviesPlayNowState;
  final String messagePlayNow;
  final List<MovieEntities> MoviesTopRate;
  final RequestState MoviesTopRateState;
  final String messageTopRate;
  final List<MovieEntities> MoviesPopuler;
  final RequestState MoviesPopulerState;
  final String messagePopuler;


  const MovieStates(
      {this.MoviesPlayNow = const [],
      this.MoviesPlayNowState = RequestState.loading,
      this.messagePlayNow = "",
      this.MoviesTopRate = const [],
      this.MoviesTopRateState = RequestState.loading,
      this.messageTopRate = "",
      this.MoviesPopuler = const [],
      this.MoviesPopulerState = RequestState.loading,
      this.messagePopuler = "",
     });

  MovieStates copyWith({
    List<MovieEntities>? MoviesPlayNow,
    RequestState? MoviesPlayNowState,
    String? messagePlayNow,
    List<MovieEntities>? MoviesTopRate,
    RequestState? MoviesTopRateState,
    String? messageTopRate,
    List<MovieEntities>? MoviesPopuler,
    RequestState? MoviesPopulerState,
    String? messagePopuler,
    MoviesDetailsEnities? MoviesDetails,
    RequestState? MoviesDetailsState,
    String? messageMoviesDetails,
  }) {
    return MovieStates(
        MoviesPlayNow: MoviesPlayNow ?? this.MoviesPlayNow,
        MoviesPlayNowState: MoviesPlayNowState ?? this.MoviesPlayNowState,
        messagePlayNow: messagePlayNow ?? this.messagePlayNow,
        MoviesTopRate: MoviesTopRate ?? this.MoviesTopRate,
        MoviesTopRateState: MoviesTopRateState ?? this.MoviesTopRateState,
        messageTopRate: messageTopRate ?? this.messageTopRate,
        MoviesPopuler: MoviesPopuler ?? this.MoviesPopuler,
        MoviesPopulerState: MoviesPopulerState ?? this.MoviesPopulerState,
        messagePopuler: messagePopuler ?? this.messagePopuler,
        );
  }

  @override
  List<Object?> get props => [
        MoviesPlayNow,
        MoviesPlayNowState,
        messagePlayNow,
        MoviesTopRateState,
        MoviesTopRate,
        messageTopRate,
        MoviesPopuler,
        MoviesPopulerState,
        messagePopuler,
      ];


}
