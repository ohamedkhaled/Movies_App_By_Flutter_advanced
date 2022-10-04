
import 'package:equatable/equatable.dart';

class SeasonsEntities extends Equatable{

    final String airDate;
    final int episodeCount;
    final int id;
    final String name;
    final String overview;
    final String posterPath;
    final seasonNumber ;

   const SeasonsEntities({required this.seasonNumber,
      required this.airDate,
       required this.episodeCount,
       required this.id,
       required this.name,
       required this.overview,
       required this.posterPath,
      });

  @override

  List<Object?> get props =>[airDate,episodeCount,id,name,overview,posterPath,seasonNumber];
}