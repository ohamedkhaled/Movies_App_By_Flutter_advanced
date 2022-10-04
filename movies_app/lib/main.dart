import 'package:flutter/material.dart';
import 'package:movies_app/Core/Serveces/Services_Locator.dart';
import 'package:movies_app/HomeScreen.dart';
import 'package:movies_app/Tv_Modul/Data/DataSource/Base_Tv_Data_Source.dart';
import 'package:movies_app/Tv_Modul/Data/Repository_Imp/Tv_Repository_Imp.dart';
import 'package:movies_app/Tv_Modul/Domin/Enities/Details_Tv.dart';
import 'package:movies_app/Tv_Modul/Domin/Repository/Base_Tv_Repository.dart';
import 'package:movies_app/Tv_Modul/Domin/UseCase/Get_Episodes_UC.dart';
import 'package:movies_app/Tv_Modul/Presentation/Screens/Detiels_Tv_Screen.dart';

import 'Core/utils/Constants_App.dart';


void main() {

  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    BaseTvDataSource baseTvDataSource = TvDataSourceImp();
    BaseTvRepository baseTvRepository = TvRepositoryImp(baseTvDataSource: baseTvDataSource);
    GetEpisodesUc(baseTvRepository: baseTvRepository).call(EpisodesParameters(id:1416,seasonNumber: 1 ));

    return MaterialApp(
      title: nameApp,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor:  KmainColor,
        appBarTheme: const AppBarTheme(
          centerTitle: true
        )
      ),
      home:HomeScreen(),
    );
  }
}