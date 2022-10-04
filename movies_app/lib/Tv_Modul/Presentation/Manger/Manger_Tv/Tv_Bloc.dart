import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Core/Use_Cases/Use_Case_Tv.dart';
import 'package:movies_app/Core/utils/enums.dart';
import 'package:movies_app/Tv_Modul/Domin/UseCase/Get_On_Air_UC.dart';
import 'package:movies_app/Tv_Modul/Domin/UseCase/Get_Populer_Tv_UC.dart';
import 'package:movies_app/Tv_Modul/Domin/UseCase/Get_TopRate_Tv_UC.dart';
import 'package:movies_app/Tv_Modul/Presentation/Manger/Manger_Tv/Tv_Events.dart';
import 'package:movies_app/Tv_Modul/Presentation/Manger/Manger_Tv/Tv_States.dart';

class TvBloc extends Bloc<TvEvents, TvStates> {
  final GetOnAirUC getOnAirUC;
  final GetPopulerTvUC getPopulerTvUC;
  final GetTopRateTvUC getTopRateTvUC;

  TvBloc(
      {required this.getOnAirUC,
      required this.getPopulerTvUC,
      required this.getTopRateTvUC})
      : super(const TvStates()) {

    on<GetTvEvents> (getOnAir) ;
    on<GetPopulerEvents> (getPopuler);
    on<GetTopRateEvents>(getTopRate);

  }

  FutureOr<void> getOnAir(GetTvEvents event, Emitter<TvStates> emit) async{
 final result= await getOnAirUC (const NoPrameters());

 result.fold((l) =>emit(  state.copyWith(OnAirMovies: l,OnAirRequest: RequestState.loaded ) )
     , (r) => emit(  state.copyWith(OnAirMessage: r.toString(),OnAirRequest: RequestState.error )));


  }



  FutureOr<void> getPopuler(GetPopulerEvents event, Emitter<TvStates> emit)async {

    final result= await getPopulerTvUC (const NoPrameters());

    result.fold((l) =>emit(  state.copyWith(PopulerTvMovies: l, PopulerTvRequest: RequestState.loaded ) )
        , (r) => emit(  state.copyWith(PopulerTvMessage: r.toString(),PopulerTvRequest: RequestState.error )));


  }

  FutureOr<void> getTopRate(GetTopRateEvents event, Emitter<TvStates> emit) async{

    final result= await getTopRateTvUC (const NoPrameters());

    result.fold((l) =>emit(  state.copyWith(TopRateTvMovies: l, TopRateTvRequest: RequestState.loaded ) )
        , (r) => emit(  state.copyWith(TopRateTvMessage: r.toString(),TopRateTvRequest: RequestState.error )));
  }
}
