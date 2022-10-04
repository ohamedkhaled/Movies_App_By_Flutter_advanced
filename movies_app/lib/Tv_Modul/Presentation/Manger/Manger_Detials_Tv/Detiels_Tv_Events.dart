

import 'package:equatable/equatable.dart';

abstract class DetielsTvEvents extends Equatable {

   const DetielsTvEvents();

}

class GetDetielsTvEvent extends DetielsTvEvents{
  final int id ;

  const GetDetielsTvEvent({required this.id});

  @override
  List<Object?> get props => [id];

}
class GetRecommendationsEvent extends DetielsTvEvents{
  final int id ;
  const GetRecommendationsEvent({required this.id});

  @override

  List<Object?> get props => [id];
}
class GetEpisodesEvent extends DetielsTvEvents{
  final int id ;
  final int seasonNumber;
  const GetEpisodesEvent({required this.id,required this.seasonNumber});

  @override
  List<Object?> get props =>[id,seasonNumber];
}


