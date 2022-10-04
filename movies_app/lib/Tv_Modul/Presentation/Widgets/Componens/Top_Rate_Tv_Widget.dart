
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Core/utils/enums.dart';
import 'package:movies_app/Core/Widgets/CachImageWidght.dart';
import 'package:movies_app/Tv_Modul/Presentation/Screens/Detiels_Tv_Screen.dart';
import '../../../../Core/utils/Api_Helper/Constant_Api.dart';
import '../../../../Core/utils/Config_Size.dart';
import '../../Manger/Manger_Tv/Tv_Bloc.dart';
import '../../Manger/Manger_Tv/Tv_States.dart';


class TopRateTvWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<TvBloc, TvStates>(
        buildWhen: (previous, current)=> previous.TopRateTvRequest != current.TopRateTvRequest,
        builder: (context, state) {
          switch(state.TopRateTvRequest){

            case RequestState.loaded:
              return  FadeIn(
                duration: const Duration(milliseconds: 200),
                child: SizedBox(
                  height: ConfigSize.screenHeight! / 3.7,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.all(5),
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DetielsTvScreen(id :state.TopRateTvMovies[index].id)));
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20), // Image border
                              child: CachImageWidght(url: ConstantApi().getImageUrl(
                                  state.TopRateTvMovies[index].backdropPath!),
                                  width: ConfigSize.defaultSize! * 13,
                                  height: ConfigSize.defaultSize! * 10
                              ),
                            ),
                          ));
                    },
                    itemCount: state.TopRateTvMovies.length,
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
                  child: Center(child: Text(state.TopRateTvMessage)));
          }

        });
  }
}






