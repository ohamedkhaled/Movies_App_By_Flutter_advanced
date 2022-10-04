

import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Movies_Modul/Domin/UseCases/Get_Recommendtion_Movies_UC.dart';


import '../../../../Core/utils/enums.dart';
import '../../../Domin/UseCases/Get_Details_Movies_UC.dart';
import 'Movie_Details_Event.dart';
import 'Movie_Details_State.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent,MoviesDetailsState>
{
  final GetDetailsMoviesUC  getDetailsMoviesUC ;
  final GetRecommendtionMoviesUC getRecommendtionMoviesUC ;

  MovieDetailsBloc({ required this.getDetailsMoviesUC,required this.getRecommendtionMoviesUC}): super( MoviesDetailsState()){

    on <GetMovieDetailsEvent>(getDetails);
    on<GetMoviesRecommendtionEvent>(getRecommendtions);
  }





  FutureOr<void> getDetails(GetMovieDetailsEvent event, Emitter<MoviesDetailsState> emit) async{
    final result =await getDetailsMoviesUC(event.id);
     print("getDetails${result}");
    result.fold(
            (l) => emit(state.copyWith(moviesDetails: l ,moviesDetailsState: RequestState.loaded)) ,
            (r) =>  emit(state.copyWith(moviesDetailsState: RequestState.error,messageMoviesDetails: r.toString())));
  }

  FutureOr<void> getRecommendtions(GetMoviesRecommendtionEvent event, Emitter<MoviesDetailsState> emit)async {
    final result =await getRecommendtionMoviesUC(event.id);
    print("getRecommendtions${result}");
    result.fold(
            (l) => emit(state.copyWith(moviesRecommendtionEnities: l ,moviesRecommendtionState: RequestState.loaded)) ,
            (r) =>  emit(state.copyWith(moviesRecommendtionState: RequestState.error,messageMoviesRecommendtion: r.toString())));

  }
}