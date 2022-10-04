import 'package:equatable/equatable.dart';
import 'package:movies_app/Core/utils/enums.dart';
import 'package:movies_app/Tv_Modul/Domin/Enities/OnAirEntities.dart';
import 'package:movies_app/Tv_Modul/Domin/Enities/Populer_Tv_Entities.dart';
import '../../../Domin/Enities/TopRate_Tv_Entities.dart';

class TvStates extends Equatable{

  final List<OnAirEntities> OnAirMovies ;
  final RequestState OnAirRequest ;
  final String OnAirMessage ;
  final List<PopulerTvEntities> PopulerTvMovies ;
  final RequestState PopulerTvRequest ;
  final String PopulerTvMessage ;
  final List<TopRateTvEntities> TopRateTvMovies ;
  final RequestState TopRateTvRequest ;
  final String TopRateTvMessage ;

 const TvStates(
      {this.OnAirMovies = const[],
       this.OnAirRequest= RequestState.loading,
       this.OnAirMessage="",
       this.PopulerTvMovies=const[],
      this.PopulerTvRequest=RequestState.loading,
        this.PopulerTvMessage="",
        this.TopRateTvMovies=const[],
        this.TopRateTvRequest=RequestState.loading,
        this.TopRateTvMessage=""});


 TvStates copyWith({
   List<OnAirEntities>? OnAirMovies ,
    RequestState? OnAirRequest ,
    String? OnAirMessage ,
    List<PopulerTvEntities>? PopulerTvMovies ,
    RequestState? PopulerTvRequest ,
    String? PopulerTvMessage ,
    List<TopRateTvEntities>? TopRateTvMovies ,
    RequestState? TopRateTvRequest ,
    String? TopRateTvMessage ,
}){
   return TvStates(
       OnAirMovies: OnAirMovies??this.OnAirMovies,
      OnAirRequest: OnAirRequest??this.OnAirRequest,
     OnAirMessage: OnAirMessage??this.OnAirMessage,
     PopulerTvMovies: PopulerTvMovies??this.PopulerTvMovies,
     PopulerTvRequest: PopulerTvRequest??this.PopulerTvRequest,
     PopulerTvMessage: PopulerTvMessage??this.PopulerTvMessage,
     TopRateTvMovies: TopRateTvMovies??this.TopRateTvMovies,
     TopRateTvRequest: TopRateTvRequest??this.PopulerTvRequest,
     TopRateTvMessage: TopRateTvMessage??this.TopRateTvMessage
   );
 }

  @override
  List<Object?> get props => [OnAirMovies,OnAirRequest,OnAirMessage,PopulerTvMovies,PopulerTvRequest,PopulerTvMessage,
    TopRateTvMovies,TopRateTvRequest,TopRateTvMessage];
}