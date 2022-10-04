import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Core/Serveces/Services_Locator.dart';
import 'package:movies_app/Tv_Modul/Presentation/Manger/Manger_Tv/Tv_Events.dart';
import '../Manger/Manger_Tv/Tv_Bloc.dart';
import '../Widgets/Bodys/Tv_Screen_Body.dart';

class TvScreen extends StatelessWidget{
  const TvScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create:(BuildContext context) => getIt<TvBloc>()..add(GetTvEvents())..add(GetPopulerEvents())
            ..add(GetTopRateEvents()),
      child:TvScreenBody()

    );
  }
}