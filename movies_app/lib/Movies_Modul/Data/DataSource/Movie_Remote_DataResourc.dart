import 'dart:async';
import 'package:movies_app/Core/utils/Api_Helper/Constant_Api.dart';
import 'package:movies_app/Movies_Modul/Data/Models/Movies_More_Model.dart';
import 'package:movies_app/Movies_Modul/Data/Models/Movies_Recommendtion_Model.dart';
import 'package:movies_app/Movies_Modul/Domin/Enities/Movie_Details_Enities.dart';
import 'package:movies_app/Movies_Modul/Domin/Enities/Movies_Recommendtion_Enities.dart';
import '../../../Core/utils/Api_Helper/Api.dart';
import '../Models/Movie_ Model.dart';
import '../Models/MoviesDetailsModel.dart';

abstract class BaseMovieRemoteDataResourc {
  Future<List<MoviesModel>> getMoviesPlayingNow();
  Future<List<MoviesModel>>  getMoviesPopuler();
  Future<List<MoviesModel>>  getMoviesTopRate();
  Future<MoviesDetailsEnities> getMovieDetails(int id );
  Future<List<MoviesRecommendtionEnities>> getMoviesRecommendtion(int id );
  Future<List<MoviesMoreModel>>  getPopulerMoviesMore();
  Future<List<MoviesMoreModel>>  getTopRateMoviesMore();
}

class MovieRemoteDataResourc extends BaseMovieRemoteDataResourc {
  @override
  Future<List<MoviesModel>> getMoviesPlayingNow() async {
     Map<String,dynamic> jasonData = await Api().Get(Url: ConstantApi.playNowUrl);


     List<MoviesModel> moviesModulList = [];

  for (int i = 0; i < jasonData["results"].length; i++) {
    moviesModulList.add(MoviesModel.fromjason(jasonData["results"][i]));
  }
  return moviesModulList;

  }

  @override
  Future<List<MoviesModel>> getMoviesPopuler() async{

    Map<String,dynamic> jasonData = await Api().Get(Url: ConstantApi.pupularUrl);

      List<MoviesModel> moviesModulList = [];

      for (int i = 0; i < jasonData["results"].length; i++) {
        moviesModulList.add(MoviesModel.fromjason(jasonData["results"][i]));
      }
      return moviesModulList;

  }

  @override
  Future<List<MoviesModel>> getMoviesTopRate() async{

    Map<String,dynamic>  jasonData = await Api().Get(Url: ConstantApi.TopRateUrl);

      List<MoviesModel> moviesModulList = [];

      for (int i = 0; i < jasonData["results"].length; i++) {
        moviesModulList.add(MoviesModel.fromjason(jasonData["results"][i]));
      }
      return moviesModulList;

   }

  @override
  Future<MoviesDetailsEnities> getMovieDetails(int id ) async{

    Map<String,dynamic> jasonData =await  Api().Get(Url:ConstantApi().getMovieDetailUrl(id));
   return MoviesDetailsModel.fromjason(jasonData) ;
  }

  @override
  Future<List<MoviesRecommendtionEnities>> getMoviesRecommendtion(int id) async{
    Map<String,dynamic> jasonData =await  Api().Get(Url:ConstantApi().getMovieRecommendtionUrl(id));

    List<MoviesRecommendtionModel> moviesRecommendtionsList = [];
    for (int i = 0; i < jasonData["results"].length; i++) {
      moviesRecommendtionsList.add(MoviesRecommendtionModel.fromjason(jasonData["results"][i]));
    }
    return moviesRecommendtionsList;

  }

  @override
  Future<List<MoviesMoreModel>> getPopulerMoviesMore() async {
    Map<String,dynamic> jasonData = await Api().Get(Url: ConstantApi.pupularUrl);

    List<MoviesMoreModel> moviesModulList = [];

    for (int i = 0; i < jasonData["results"].length; i++) {
      moviesModulList.add(MoviesMoreModel.fromjason(jasonData["results"][i]));
    }
    return moviesModulList;
  }

  @override
  Future<List<MoviesMoreModel>> getTopRateMoviesMore() async {

    Map<String,dynamic>  jasonData = await Api().Get(Url: ConstantApi.TopRateUrl);

    List<MoviesMoreModel> moviesModulList = [];

    for (int i = 0; i < jasonData["results"].length; i++) {
      moviesModulList.add(MoviesMoreModel.fromjason(jasonData["results"][i]));
    }
    return moviesModulList;

  }


}
