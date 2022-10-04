
import 'package:dartz/dartz.dart';
import 'package:movies_app/Tv_Modul/Domin/Enities/Details_Tv.dart';
import 'package:movies_app/Tv_Modul/Domin/Enities/Episodes_Entities.dart';
import 'package:movies_app/Tv_Modul/Domin/Enities/OnAirEntities.dart';
import 'package:movies_app/Tv_Modul/Domin/Enities/Populer_Tv_Entities.dart';
import 'package:movies_app/Tv_Modul/Domin/Enities/Recommendations_Tv_Entities.dart';
import 'package:movies_app/Tv_Modul/Domin/Enities/TopRate_Tv_Entities.dart';
import 'package:movies_app/Tv_Modul/Domin/Repository/Base_Tv_Repository.dart';

import '../DataSource/Base_Tv_Data_Source.dart';

class TvRepositoryImp extends BaseTvRepository {

  final BaseTvDataSource baseTvDataSource;

  TvRepositoryImp({required this.baseTvDataSource});


  @override
  Future<Either<List<OnAirEntities>, Exception>> getOnAir() async {
    try {
      return left(await baseTvDataSource.getOnAirFromApi());
    } catch (e) {
      return Right(Exception(e.toString()));
    }
  }

  @override
  Future<Either<List<PopulerTvEntities>, Exception>> getPopulerTv() async {
    try {
      return Left(await baseTvDataSource.getPopulerModel());
    } catch (e) {
      return Right(Exception(e.toString()));
    }
  }

  @override
  Future<Either<List<TopRateTvEntities>, Exception>> getTopRateTv() async{

    try {
      return Left(await baseTvDataSource.getTopRateModel());
    } catch (e) {
    return Right(Exception(e.toString()));
    }
  }

  @override
  Future<Either<DetielsTv, Exception>> getDeteilsTv(int id) async {
   try{
     return Left( await baseTvDataSource.getDetielsTv(id));

   }catch(e){
     return Right(Exception(e.toString()));
   }
  }

  @override
  Future<Either<List<RecommendationsTvEntities>, Exception>> getRecommendationsTv(int id) async {

    try{
      return Left(await baseTvDataSource.getRecommendationsTv(id));
    }catch(e){
      return Right(Exception(e.toString()) );
    }
  }

  @override
  Future<Either<List<EpisodesEntities>, Exception>> getEpisodesTv(int id, int seasonNumber) async {

    try{
     return Left(await baseTvDataSource.getEpisodesTv(id, seasonNumber));
   }catch(e){
     return Right(Exception(e.toString()) );
   }
  }

}