
import 'package:flutter/cupertino.dart';
import 'package:movies_app/Core/utils/Api_Helper/Constant_Api.dart';
import 'package:movies_app/Tv_Modul/Data/Models/Detiels_Tv_Model.dart';
import 'package:movies_app/Tv_Modul/Data/Models/On_Air_Model.dart';
import 'package:movies_app/Tv_Modul/Data/Models/Populer_Tv_Model.dart';
import '../../../Core/utils/Api_Helper/Api.dart';
import '../Models/Episodes_Tv_Model.dart';
import '../Models/Recommendations_Tv_Model.dart';
import '../Models/TopRate_Tv_Model.dart';

abstract class BaseTvDataSource {

  Future<List<OnAirModel>> getOnAirFromApi();
  Future<List<PopulerTvModel>> getPopulerModel();
  Future<List<TopRateTvModel>> getTopRateModel();
  Future<DetielsTvModel> getDetielsTv(int id);
  Future<List<RecommendationsTvModel>> getRecommendationsTv(int id);
  Future<List<EpisodesTvModel>> getEpisodesTv(int id,int seasonNumber);

}

class TvDataSourceImp extends BaseTvDataSource{


  @override
  Future<List<OnAirModel>> getOnAirFromApi() async {

   Map<String,dynamic> jasonData = await Api().Get(Url:ConstantApi.OnAirUrl);

   List<OnAirModel> onAirModelList = [];


   for(int i=0;i<jasonData["results"].length;i++){
     onAirModelList.add(OnAirModel.fromjason( jasonData["results"][i]));
   }


   return onAirModelList ;
   
  }

  @override
  Future<List<PopulerTvModel>> getPopulerModel() async {

    Map<String,dynamic> jasonData = await Api().Get(Url: ConstantApi.PopulerTvUrl);
    List<PopulerTvModel> populerTvModelList = [];

    for(int i=0;i<jasonData["results"].length;i++){
      populerTvModelList.add(PopulerTvModel.fromjason( jasonData["results"][i]));
  }

    return populerTvModelList;
  }

  @override
  Future<List<TopRateTvModel>> getTopRateModel() async {
    Map<String,dynamic> jasonData = await Api().Get(Url: ConstantApi.TopRateTvUrl);
    List<TopRateTvModel> topRateTvModelList = [];


    for(int i=0;i<jasonData["results"].length;i++){
      topRateTvModelList.add(TopRateTvModel.fromjason( jasonData["results"][i]));
    }

    return topRateTvModelList;
  }

  @override
  Future<DetielsTvModel> getDetielsTv(int id) async {

    Map<String,dynamic> jasonData = await Api().Get(Url: ConstantApi().getTvDetailUrl(id));


    return DetielsTvModel.fromjason(jasonData);

  }

  @override
  Future<List<RecommendationsTvModel>> getRecommendationsTv(int id)  async{

    Map<String,dynamic> jasonData =  await Api().Get(Url: ConstantApi().getTvReccommendationsUrl(id));
    List<RecommendationsTvModel> RecommendationsTvList = [];
    for(int i=0;i<jasonData["results"].length;i++){
      RecommendationsTvList.add(RecommendationsTvModel.fromJason(jasonData["results"][i]));
    }

    return RecommendationsTvList;
  }

  @override
  Future<List<EpisodesTvModel>> getEpisodesTv(int id, int seasonNumber) async {

    Map<String,dynamic> jasonData = await Api().Get(Url:ConstantApi().getTvEpisodesUrl(id, seasonNumber) );
    List<EpisodesTvModel> episodesTvList = [];

    for(int i=0;i<jasonData["episodes"].length;i++){
      episodesTvList.add(EpisodesTvModel.fromjason(jasonData["episodes"][i]));
    }

    return episodesTvList;
  }

}