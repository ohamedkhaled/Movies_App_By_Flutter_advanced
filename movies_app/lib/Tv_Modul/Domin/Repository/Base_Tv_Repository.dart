
import 'package:dartz/dartz.dart';
import 'package:movies_app/Tv_Modul/Domin/Enities/Details_Tv.dart';
import 'package:movies_app/Tv_Modul/Domin/Enities/Episodes_Entities.dart';
import 'package:movies_app/Tv_Modul/Domin/Enities/OnAirEntities.dart';
import 'package:movies_app/Tv_Modul/Domin/Enities/Populer_Tv_Entities.dart';

import '../Enities/Recommendations_Tv_Entities.dart';
import '../Enities/TopRate_Tv_Entities.dart';

abstract class BaseTvRepository {

Future<Either<List<OnAirEntities>,Exception>> getOnAir();

Future<Either<List<PopulerTvEntities>,Exception>> getPopulerTv();

Future<Either<List<TopRateTvEntities>,Exception>> getTopRateTv();
Future<Either<DetielsTv,Exception>> getDeteilsTv(int id);
Future<Either<List<RecommendationsTvEntities>,Exception>> getRecommendationsTv(int id);
Future<Either<List<EpisodesEntities>,Exception>> getEpisodesTv(int id,int seasonNumber);

}