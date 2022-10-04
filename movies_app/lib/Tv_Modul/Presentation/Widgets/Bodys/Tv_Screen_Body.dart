
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/Core/Widgets/Split_Component_Widget.dart';
import 'package:movies_app/Tv_Modul/Presentation/Screens/Pupuler_Tv_More_Screen.dart';
import 'package:movies_app/Tv_Modul/Presentation/Screens/TopRate_Tv_More_Screen.dart';

import '../../../../Core/utils/Constants_App.dart';
import '../../../../Movies_Modul/Presentation/Screens/Movies_More_TopRate_Screen.dart';
import '../Componens/On_Air_Widget.dart';
import '../Componens/Populer_Tv_Widget.dart';
import '../Componens/Top_Rate_Tv_Widget.dart';

class TvScreenBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: const Key("tvScrollView"),
      child: Column(
        children: [
          OnAirWidget(),
          SplitComponent(title: populer, seeMore:SeeMorePopuler ),
          PopulerTvWidget(),
          SplitComponent(title: topRate, seeMore:SeeMoreTopRate ),
          TopRateTvWidget(),
        ],
      ),
    );
  }


  SeeMorePopuler(BuildContext context ){
    Navigator.push(context, MaterialPageRoute(builder: (context) => PupulerTvMoreScreen()));
  }

  SeeMoreTopRate(BuildContext context ){
    Navigator.push(context, MaterialPageRoute(builder: (context) => TopRateTvMoreScreen()));
  }
}