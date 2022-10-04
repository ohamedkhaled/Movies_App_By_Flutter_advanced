
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Core/Use_Cases/Use_Case_Movies.dart';
import 'package:movies_app/Core/utils/enums.dart';
import 'package:movies_app/Movies_Modul/Domin/UseCases/Get_Populer_Movies_UC.dart';
import 'package:movies_app/Movies_Modul/Domin/UseCases/Get_Top_Rate_Movies_UC.dart';
import 'package:movies_app/Movies_Modul/Presentation/Manger/Manager_Movies/Movie_Events.dart';
import '../../../Domin/UseCases/Get_Now_Playiny_Movies_UC.dart';
import 'Movie_States.dart';

class MovieBloc extends Bloc<MovieEvents,MovieStates>{
  final GetPlayingNowMoviesUC getPlayingNowMoviesUC ;
  final GetPopulerMoviesUC getPopulerMoviesUC ;
  final GetTopRateMoviesUC getTopRateMoviesUC ;
  MovieBloc({ required this.getPlayingNowMoviesUC,
    required this.getPopulerMoviesUC,
    required this.getTopRateMoviesUC }) : super ( const MovieStates()){


     on<GetPlayingNowEvent>(getNowPlaying);

     on<GetTopRateEvent>(getTopRate);

    on<GetPopulerEvent>(getPopuler);






  }



  FutureOr<void> getNowPlaying(GetPlayingNowEvent event, Emitter<MovieStates> emit)async {
      final result = await getPlayingNowMoviesUC(const NoPrameters()); //call method
      result.fold((l) =>
          emit(  state.copyWith( MoviesPlayNow:l  ,MoviesPlayNowState: RequestState.loaded))
          , (r) => emit( state.copyWith(MoviesPlayNowState: RequestState.error ,messagePlayNow: r.toString() )));
    }


  FutureOr<void> getTopRate(GetTopRateEvent event, Emitter<MovieStates> emit)  async{

      final result = await getTopRateMoviesUC(const NoPrameters()); //call method
      result.fold(
              (l) => emit( state.copyWith(MoviesTopRate: l ,MoviesTopRateState: RequestState.loaded )) ,
              (r) => emit( state.copyWith( MoviesTopRateState: RequestState.error ,messageTopRate: r.toString())));

  }

  FutureOr<void> getPopuler(GetPopulerEvent event, Emitter<MovieStates> emit) async {

      final result = await getPopulerMoviesUC(const NoPrameters()); //call method

      result.fold(
              (l) => emit(state.copyWith( MoviesPopuler: l ,MoviesPopulerState: RequestState.loaded)) ,
              (r) => emit(state.copyWith( MoviesPopulerState: RequestState.error,messagePopuler: r.toString())));

  }


}
