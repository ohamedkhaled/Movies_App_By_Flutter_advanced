import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import 'package:movies_app/Core/utils/enums.dart';
import 'package:movies_app/Movies_Modul/Domin/Enities/Movies_Recommendtion_Enities.dart';

import '../../../Domin/Enities/Movie_Details_Enities.dart';

class MoviesDetailsState extends Equatable {
  final MoviesDetailsEnities? moviesDetails;
  final RequestState moviesDetailsState;
  final String messageMoviesDetails;
  final List<MoviesRecommendtionEnities> moviesRecommendtionEnities;
  final RequestState moviesRecommendtionState;
  final String messageMoviesRecommendtion;

  MoviesDetailsState(
      {this.moviesDetails,
      this.moviesDetailsState = RequestState.loading,
      this.messageMoviesDetails = "",
      this.moviesRecommendtionEnities = const [],
      this.moviesRecommendtionState = RequestState.loading,
      this.messageMoviesRecommendtion = ""});

  MoviesDetailsState copyWith({
    MoviesDetailsEnities? moviesDetails,
    RequestState? moviesDetailsState,
    String? messageMoviesDetails,
    List<MoviesRecommendtionEnities>? moviesRecommendtionEnities,
    RequestState? moviesRecommendtionState,
    String? messageMoviesRecommendtion,
  }) {
    return MoviesDetailsState(
        moviesDetails: moviesDetails ?? this.moviesDetails,
        moviesDetailsState: moviesDetailsState ?? this.moviesDetailsState,
        messageMoviesDetails: messageMoviesDetails ?? this.messageMoviesDetails,
        moviesRecommendtionEnities:
            moviesRecommendtionEnities ?? this.moviesRecommendtionEnities,
        moviesRecommendtionState:
            moviesRecommendtionState ?? this.moviesRecommendtionState,
        messageMoviesRecommendtion:
            messageMoviesRecommendtion ?? this.messageMoviesRecommendtion);
  }

  @override
  List<Object?> get props =>
      [messageMoviesDetails, moviesDetails, moviesDetailsState,moviesRecommendtionState,moviesRecommendtionEnities,messageMoviesRecommendtion];
}
