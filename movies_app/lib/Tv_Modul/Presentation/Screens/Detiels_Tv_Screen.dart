import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Core/Serveces/Services_Locator.dart';
import 'package:movies_app/Core/utils/Constants_App.dart';
import 'package:movies_app/Tv_Modul/Presentation/Manger/Manger_Detials_Tv/Detiels_Tv_Bloc.dart';
import 'package:movies_app/Tv_Modul/Presentation/Manger/Manger_Detials_Tv/Detiels_Tv_Events.dart';

import '../../../Core/utils/Config_Size.dart';
import '../Widgets/Bodys/Detiels_Tv_Screen_Body.dart';

class DetielsTvScreen extends StatelessWidget{
final int id ;


DetielsTvScreen({required this.id});

  @override
  Widget build(BuildContext context) {
    ConfigSize().init(context);
    return BlocProvider(
      create: (BuildContext context)=>getIt<DetielsTvBloc>()..add(
        GetDetielsTvEvent(id: id))..add(GetRecommendationsEvent(id: id)),
      child: Scaffold(
      backgroundColor: KscondryColor,
      body: DetielsTvScreenBody(),
    )
    );
  }
}