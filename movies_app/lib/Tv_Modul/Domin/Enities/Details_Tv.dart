import 'package:equatable/equatable.dart';
import 'package:movies_app/Tv_Modul/Domin/Enities/Genres.dart';
import 'package:movies_app/Tv_Modul/Domin/Enities/Seasons_Entities.dart';

class DetielsTv extends Equatable {
  final String? backdropPath;
  final String name;
  final String firstAirDate;
  final String overView;
  final double voteAverage;
  final int id;
  final List<GenresEntitiesTv> genres;
  final List<int>? episodeRunTime;
  final int numberOfSeasons;
  final List<SeasonsEntities> seasons;

  DetielsTv({
    required this.seasons,
    this.backdropPath,
    required this.name,
    required this.firstAirDate,
    required this.overView,
    required this.voteAverage,
    required this.id,
    required this.genres,
    this.episodeRunTime,
    required this.numberOfSeasons,
  });

  @override
  List<Object?> get props => [
        backdropPath,
        name,
        firstAirDate,
        overView,
        voteAverage,
        id,
        genres,
        episodeRunTime,
        numberOfSeasons,
        seasons
      ];
}
