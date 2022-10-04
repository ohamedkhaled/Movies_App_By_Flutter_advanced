import 'package:get_it/get_it.dart';
import 'package:movies_app/Movies_Modul/Data/DataSource/Movie_Remote_DataResourc.dart';
import 'package:movies_app/Movies_Modul/Data/Repository_Imp/Movie_Repository_Imp.dart';
import 'package:movies_app/Movies_Modul/Domin/Repository/Base_Movie_Repository.dart';
import 'package:movies_app/Movies_Modul/Domin/UseCases/Get_Details_Movies_UC.dart';
import 'package:movies_app/Movies_Modul/Domin/UseCases/Get_More_TopRate_Movies_UC.dart';
import 'package:movies_app/Movies_Modul/Domin/UseCases/Get_Now_Playiny_Movies_UC.dart';
import 'package:movies_app/Movies_Modul/Domin/UseCases/Get_Populer_Movies_UC.dart';
import 'package:movies_app/Movies_Modul/Domin/UseCases/Get_Recommendtion_Movies_UC.dart';
import 'package:movies_app/Movies_Modul/Presentation/Manger/Manger_Details/Movie_Details_bloc.dart';
import 'package:movies_app/Movies_Modul/Presentation/Manger/Manager_Movies/Movie_bloc.dart';
import 'package:movies_app/Movies_Modul/Presentation/Manger/Manger_More_TopRate/Movies_TopRate_More_Bloc.dart';
import 'package:movies_app/Movies_Modul/Presentation/Manger/Manger_More_Populer/Movies_more_Bloc.dart';
import 'package:movies_app/Tv_Modul/Data/Repository_Imp/Tv_Repository_Imp.dart';
import 'package:movies_app/Tv_Modul/Domin/Repository/Base_Tv_Repository.dart';
import 'package:movies_app/Tv_Modul/Domin/UseCase/Get_Details_Tv_Movie_UC.dart';
import 'package:movies_app/Tv_Modul/Domin/UseCase/Get_Episodes_UC.dart';
import 'package:movies_app/Tv_Modul/Domin/UseCase/Get_On_Air_UC.dart';
import 'package:movies_app/Tv_Modul/Domin/UseCase/Get_Recommendations_Tv_UC.dart';
import 'package:movies_app/Tv_Modul/Domin/UseCase/Get_TopRate_Tv_UC.dart';
import 'package:movies_app/Tv_Modul/Presentation/Manger/Manger_Detials_Tv/Detiels_Tv_Bloc.dart';
import 'package:movies_app/Tv_Modul/Presentation/Manger/Manger_Detials_Tv/Detiels_Tv_States.dart';
import 'package:movies_app/Tv_Modul/Presentation/Manger/Manger_Tv/Tv_Bloc.dart';

import '../../Movies_Modul/Domin/UseCases/Get_More_Populer_Movies_UC.dart';
import '../../Movies_Modul/Domin/UseCases/Get_Top_Rate_Movies_UC.dart';
import '../../Tv_Modul/Data/DataSource/Base_Tv_Data_Source.dart';
import '../../Tv_Modul/Domin/UseCase/Get_Populer_Tv_UC.dart';

final getIt = GetIt.instance;

class ServicesLocator {
  void init() {
    getIt.registerLazySingleton<BaseMovieRemoteDataResourc>(
        () => MovieRemoteDataResourc());

    getIt.registerLazySingleton<BaseMovieRepository>(
        () => MoviesRepository(baseMovieRemoteDataResourc: getIt()));

    getIt.registerLazySingleton<BaseTvDataSource>(() => TvDataSourceImp());

    getIt.registerLazySingleton<BaseTvRepository>(() => TvRepositoryImp(baseTvDataSource: getIt()));

    //UseCases
    getIt.registerLazySingleton(
        () => GetPlayingNowMoviesUC(baseMovieRepository: getIt()));
    getIt.registerLazySingleton(
        () => GetPopulerMoviesUC(baseMovieRepository: getIt()));
    getIt.registerLazySingleton(
        () => GetTopRateMoviesUC(baseMovieRepository: getIt()));
    getIt.registerLazySingleton(
        () => GetDetailsMoviesUC(baseMovieRepository: getIt()));
    getIt.registerLazySingleton(
        () => GetRecommendtionMoviesUC(baseMovieRepository: getIt()));
    getIt.registerLazySingleton(
        () => GetMoreTopRateMoviesUC(baseMovieRepository: getIt()));
    getIt.registerLazySingleton(
        () => GetMorePopulerMoviesUC(baseMovieRepository: getIt()));
    getIt
        .registerLazySingleton(() => GetPopulerTvUC(baseTvRepository: getIt()));
    getIt.registerLazySingleton(() => GetOnAirUC(baseTvRepository: getIt()));
    getIt
        .registerLazySingleton(() => GetTopRateTvUC(baseTvRepository: getIt()));
    getIt.registerLazySingleton(() => GetDetailsTvMoviesUC(baseTvRepository: getIt()));

    getIt.registerLazySingleton(() => GetEpisodesUc(baseTvRepository: getIt()));

    getIt.registerLazySingleton(() => GetRecommendationsTvUC(baseTvRepository: getIt()));

    //blocs
    getIt.registerFactory(() => MovieBloc(
          getPlayingNowMoviesUC: getIt(),
          getPopulerMoviesUC: getIt(),
          getTopRateMoviesUC: getIt(),
        ));

    getIt.registerFactory(() => MovieDetailsBloc(
        getDetailsMoviesUC: getIt(), getRecommendtionMoviesUC: getIt()));

    getIt.registerFactory(
        () => MoviesMoreBloc(getMorePopulerMoviesUC: getIt()));

    getIt.registerFactory(
        () => MoviesTopRateMoreBloc(getMoreTopRateMoviesUC: getIt()));

    getIt.registerFactory(() => TvBloc(
        getOnAirUC: getIt(), getPopulerTvUC: getIt(), getTopRateTvUC: getIt()));

    getIt.registerFactory(() => DetielsTvBloc(
        getDetailsTvMoviesUC: getIt(),
        getRecommendationsTvUC: getIt(),
        getEpisodesUc: getIt()));
  }
}
