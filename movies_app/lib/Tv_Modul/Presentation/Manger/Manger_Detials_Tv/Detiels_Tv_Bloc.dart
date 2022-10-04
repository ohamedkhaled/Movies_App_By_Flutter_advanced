

import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Core/utils/enums.dart';
import 'package:movies_app/Tv_Modul/Domin/UseCase/Get_Details_Tv_Movie_UC.dart';
import 'package:movies_app/Tv_Modul/Domin/UseCase/Get_Episodes_UC.dart';
import 'package:movies_app/Tv_Modul/Domin/UseCase/Get_Recommendations_Tv_UC.dart';
import 'package:movies_app/Tv_Modul/Presentation/Manger/Manger_Detials_Tv/Detiels_Tv_Events.dart';
import 'package:movies_app/Tv_Modul/Presentation/Manger/Manger_Detials_Tv/Detiels_Tv_States.dart';

class DetielsTvBloc extends Bloc<DetielsTvEvents,DetielsTvStates>{
  final GetEpisodesUc getEpisodesUc;
  final GetRecommendationsTvUC getRecommendationsTvUC;
  final GetDetailsTvMoviesUC getDetailsTvMoviesUC;

  DetielsTvBloc({ required this.getDetailsTvMoviesUC,required this.getRecommendationsTvUC,required this.getEpisodesUc}):
   super (DetielsTvStates()){
    on<GetDetielsTvEvent>(getDetiels);
    on<GetEpisodesEvent>(getEpisodes);
    on<GetRecommendationsEvent>(getRecommendations);
  }



  FutureOr<void> getDetiels(GetDetielsTvEvent event, Emitter<DetielsTvStates> emit) async {

    final result= await getDetailsTvMoviesUC.call(event.id);

    result.fold(
            (l) => emit(state.copyWith(detilesTv: l,detilesTvState: RequestState.loaded)) ,
            (r) =>emit(state.copyWith(detilesTvMessage: r.toString() ,detilesTvState: RequestState.loaded)) );
  }

  FutureOr<void> getEpisodes(GetEpisodesEvent event, Emitter<DetielsTvStates> emit) async{

    final result= await getEpisodesUc.call(EpisodesParameters(id: event.id,seasonNumber: event.seasonNumber));

    result.fold(
            (l) => emit(state.copyWith(episodes: l,episodesState: RequestState.loaded)) ,
            (r) =>emit(state.copyWith(episodesMessage: r.toString() ,episodesState: RequestState.loaded)) );

  }



  FutureOr<void> getRecommendations(GetRecommendationsEvent event, Emitter<DetielsTvStates> emit) async {

    final result= await getRecommendationsTvUC.call(event.id);

    result.fold(
            (l) => emit(state.copyWith(recommendationsTv: l,recommendationsTvState: RequestState.loaded)) ,
            (r) =>emit(state.copyWith(recommendationsTvMessage: r.toString() ,recommendationsTvState: RequestState.loaded)) );
  }
}