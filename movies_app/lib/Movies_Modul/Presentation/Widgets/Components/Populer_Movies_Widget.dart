import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Core/utils/enums.dart';
import 'package:movies_app/Movies_Modul/Presentation/Manger/Manager_Movies/Movie_bloc.dart';
import 'package:movies_app/Core/Widgets/CachImageWidght.dart';
import '../../../../Core/utils/Api_Helper/Constant_Api.dart';
import '../../../../Core/utils/Config_Size.dart';
import '../../Manger/Manager_Movies/Movie_States.dart';
import '../../Screens/Movie_Details_Screen.dart';

class PopulerMoviesWidget extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieStates>(
        buildWhen: (previous, current)=> previous.MoviesPopulerState != current.MoviesPopulerState,
        builder: (context, state) {

          switch(state.MoviesPopulerState){

            case RequestState.loaded:
              return FadeIn(
                duration: const Duration(milliseconds: 200),
                child: SizedBox(
                  height: ConfigSize.screenHeight! / 3.7,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.all(5),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailsScreen(id :state.MoviesPopuler[index].id)));
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20), // Image border
                              child: CachImageWidght(url: ConstantApi().getImageUrl(
                                  state.MoviesPopuler[index].backdropPath,),
                                  width: ConfigSize.defaultSize! * 13,
                                  height: ConfigSize.defaultSize! * 10
                              )
                            ),
                          ));
                    },
                    itemCount: state.MoviesPopuler.length-10,
                  ),
                ),
              );
            case RequestState.loading:
              return  SizedBox(
                height: ConfigSize.defaultSize! * 40,
                child: Center(child: CircularProgressIndicator()),
              );
            case RequestState.error:
              return SizedBox(
                  height: ConfigSize.defaultSize! * 40,
                  child: Center(child: Text(state.messagePlayNow)));
          }
    });
  }
}
