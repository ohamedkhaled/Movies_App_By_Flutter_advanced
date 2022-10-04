import 'package:equatable/equatable.dart';
import 'package:movies_app/Core/utils/enums.dart';
import 'package:movies_app/Tv_Modul/Domin/Enities/Episodes_Entities.dart';
import 'package:movies_app/Tv_Modul/Domin/Enities/Recommendations_Tv_Entities.dart';
import '../../../Domin/Enities/Details_Tv.dart';

class DetielsTvStates extends Equatable {
  final DetielsTv? detilesTv;
  final RequestState detilesTvState;
  final String detilesTvMessage;
  final List<RecommendationsTvEntities> recommendationsTv;
  final RequestState recommendationsTvState;
  final String recommendationsTvMessage;
  final List<EpisodesEntities> episodes;
  final RequestState episodesState;
  final String episodesMessage;

  const DetielsTvStates(
      {this.detilesTv,
      this.detilesTvState = RequestState.loading,
      this.detilesTvMessage = "",
      this.recommendationsTv = const [],
      this.recommendationsTvState = RequestState.loading,
      this.recommendationsTvMessage = "",
      this.episodes = const [],
      this.episodesState = RequestState.loading,
      this.episodesMessage = ""});

  DetielsTvStates copyWith({
    DetielsTv? detilesTv,
    RequestState? detilesTvState,
    String? detilesTvMessage,
    List<RecommendationsTvEntities>? recommendationsTv,
    RequestState? recommendationsTvState,
    String? recommendationsTvMessage,
    List<EpisodesEntities>? episodes,
    RequestState? episodesState,
    String? episodesMessage,
  }) {
    return DetielsTvStates(
        detilesTv: detilesTv ?? this.detilesTv,
        detilesTvState: detilesTvState ?? this.detilesTvState,
        detilesTvMessage: detilesTvMessage ?? this.detilesTvMessage,
        recommendationsTv: recommendationsTv ?? this.recommendationsTv,
        recommendationsTvState:
            recommendationsTvState ?? this.recommendationsTvState,
        recommendationsTvMessage:
            recommendationsTvMessage ?? this.recommendationsTvMessage,
        episodes: episodes ?? this.episodes,
        episodesState: episodesState ?? this.episodesState,
        episodesMessage: episodesMessage ?? this.episodesMessage);
  }

  @override
  List<Object?> get props => [
        detilesTv,
        detilesTvState,
        detilesTvMessage,
        recommendationsTv,
        recommendationsTvState,
        recommendationsTvMessage,
        episodes,
        episodesState,
        episodesMessage
      ];
}
