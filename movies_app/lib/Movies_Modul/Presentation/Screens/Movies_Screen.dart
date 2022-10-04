import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Core/utils/Constants_App.dart';
import 'package:movies_app/Movies_Modul/Presentation/Manger/Manager_Movies/Movie_Events.dart';
import 'package:movies_app/Movies_Modul/Presentation/Screens/Movies_Populer_More_Screen.dart';
import '../../../Core/Serveces/Services_Locator.dart';
import '../../../Core/Widgets/Custom_Bottom_Navigation_Bar.dart';
import '../../../Core/utils/Config_Size.dart';
import '../Manger/Manager_Movies/Movie_bloc.dart';
import '../Widgets/Components/Now_Playing_Widght.dart';
import '../Widgets/Components/Populer_Movies_Widget.dart';
import '../../../Core/Widgets/Split_Component_Widget.dart';
import '../Widgets/Components/Top_Rate_Movies_Widget.dart';
import 'Movies_More_TopRate_Screen.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return
      BlocProvider(
        create: (BuildContext context)=>getIt<MovieBloc>()..add(GetPlayingNowEvent())
          ..add( GetTopRateEvent())..add(GetPopulerEvent()),
        child:  SingleChildScrollView(
          key: const Key('movieScrollView'),
          child: Column(
            children: [
              NowPlayingWidget(),
              SplitComponent( title:populer,seeMore:SeeMorePopuler ),
              PopulerMoviesWidget(),
              SplitComponent( title:topRate,seeMore: SeeMoreTopRate ),
              TopRateMoviesWidget(),
            ],
          ),
        ),
      );
  }

  SeeMorePopuler(BuildContext context ){
    Navigator.push(context, MaterialPageRoute(builder: (context) => MoviesMorePopulerScreen()));
  }

  SeeMoreTopRate(BuildContext context ){
    Navigator.push(context, MaterialPageRoute(builder: (context) => MoviesMoreTopRateScreen()));
  }
}
