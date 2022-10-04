import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/Tv_Modul/Presentation/Widgets/Componens/Show_Episodes.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../Core/utils/Api_Helper/Constant_Api.dart';
import '../../../../Core/utils/Config_Size.dart';
import '../../../../Core/utils/Constants_App.dart';
import '../../../../Core/utils/Methods.dart';
import '../../../../Core/utils/enums.dart';
import '../../Manger/Manger_Detials_Tv/Detiels_Tv_Bloc.dart';
import '../../Manger/Manger_Detials_Tv/Detiels_Tv_States.dart';

class DetielsTvScreenBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DetielsTvScreenBody();
  }
}

class _DetielsTvScreenBody extends State<DetielsTvScreenBody>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    return BlocBuilder<DetielsTvBloc,DetielsTvStates>(
    builder: (BuildContext context, state) {
       switch(state.detilesTvState){

         case RequestState.loaded:
           return DefaultTabController(
             length: 2,
             child: Container(
               child: CustomScrollView(

                 slivers: [
                   SliverAppBar(
                     pinned: true,
                     expandedHeight: ConfigSize.defaultSize! * 30,
                     flexibleSpace: FlexibleSpaceBar(
                       background: FadeIn(
                         duration: const Duration(milliseconds: 500),
                         child: ShaderMask(
                           shaderCallback: (rect) {
                             return const LinearGradient(
                               begin: Alignment.topCenter,
                               end: Alignment.bottomCenter,
                               colors: [
                                 Colors.transparent,
                                 Colors.black,
                                 Colors.black,
                                 Colors.transparent,
                               ],
                               stops: [0.0, 0.5, 1.0, 1.0],
                             ).createShader(
                               Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
                             );
                           },
                           blendMode: BlendMode.dstIn,
                           child: CachedNetworkImage(
                             width: ConfigSize.screenHeight,
                             imageUrl: ConstantApi().getImageUrl(state.detilesTv!.backdropPath!),
                             fit: BoxFit.cover,
                           ),
                         ),
                       ),
                     ),
                   ),
                   SliverToBoxAdapter(
                     child: FadeInUp(
                       duration: Duration(milliseconds: 500),
                       from: 20, //control scal of  animation
                       child: Padding(
                         padding: const EdgeInsets.all(12),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text(state.detilesTv!.name,
                                 style: GoogleFonts.poppins(
                                   fontSize: 23,
                                   fontWeight: FontWeight.w700,
                                   letterSpacing: 1.2,
                                 )),
                             SizedBox(height: ConfigSize.defaultSize),
                             Row(
                               children: [
                                 Container(
                                   padding: const EdgeInsets.symmetric(
                                     vertical: 2.0,
                                     horizontal: 8.0,
                                   ),
                                   decoration: BoxDecoration(
                                     color: Colors.grey[800],
                                     borderRadius: BorderRadius.circular(4.0),
                                   ),
                                   child: Text(
                                       state.detilesTv!.firstAirDate.split('-')[0],
                                     style: const TextStyle(
                                       fontSize: 16.0,
                                       fontWeight: FontWeight.w500,
                                     ),
                                   ),
                                 ),
                                 const SizedBox(width: 16.0),
                                 Row(
                                   children: [
                                     const Icon(
                                       Icons.star,
                                       color: Colors.amber,
                                       size: 20.0,
                                     ),
                                     const SizedBox(width: 4.0),
                                     Text(
                                       (state.detilesTv!.voteAverage / 2).toStringAsFixed(1),
                                       style: const TextStyle(
                                         fontSize: 16.0,
                                         fontWeight: FontWeight.w500,
                                         letterSpacing: 1.2,
                                       ),
                                     ),
                                     const SizedBox(width: 4.0),
                                     Text(
                                       '(${state.detilesTv!.voteAverage})',
                                       style: const TextStyle(
                                         fontSize: 2,
                                         fontWeight: FontWeight.w500,
                                         letterSpacing: 1.2,
                                       ),
                                     ),
                                   ],
                                 ),
                                 const SizedBox(width: 16.0),
                                 Text(
                                   Methods.showFormatRunTime(state.detilesTv!.episodeRunTime?[0]??25),
                                   style: const TextStyle(
                                     color: Colors.white70,
                                     fontSize: 16.0,
                                     fontWeight: FontWeight.w500,
                                     letterSpacing: 1.2,
                                   ),
                                 ),
                               ],
                             ),
                             SizedBox(
                               height: ConfigSize.defaultSize! * 1.5,
                             ),
                             Text(
                               state.detilesTv!.overView,
                               style: const TextStyle(
                                 fontSize: 14.0,
                                 fontWeight: FontWeight.w400,
                                 letterSpacing: 1.2,
                               ),
                             ),
                             SizedBox(
                               height: ConfigSize.defaultSize! * 1.5,
                             ),
                             Text(
                               '${genres}: ${Methods.showGenres2(state.detilesTv!.genres)}',
                               style: const TextStyle(
                                 color: Colors.white70,
                                 fontSize: 12.0,
                                 fontWeight: FontWeight.w500,
                                 letterSpacing: 1.2,
                               ),
                             )
                           ],
                         ),
                       ),
                     ),
                   ),
                   SliverToBoxAdapter( child: SizedBox(height: ConfigSize.defaultSize!*2,)),
                   SliverToBoxAdapter(
                     child: TabBar(
                       controller:tabController ,
                       tabs: [
                         FadeInUp(
                           from: 20,
                           duration: const Duration(milliseconds: 500),
                           child: Text(
                             moreLikeThis,
                             style: const TextStyle(
                               fontSize: 16.0,
                               fontWeight: FontWeight.w500,
                               letterSpacing: 1.2,
                             ),
                           ),

                         ),
                         FadeInUp(
                           from: 20,
                           duration: const Duration(milliseconds: 500),
                           child: Text(
                             eposides,
                             style: const TextStyle(
                               fontSize: 16.0,
                               fontWeight: FontWeight.w500,
                               letterSpacing: 1.2,
                             ),
                           ),

                         ),


                       ],
                     ),
                   ),
                   SliverFillRemaining(
                     child:  Container(
                       width: double.infinity,
                       child: TabBarView(
                         controller: tabController,
                         children: [
                           GridView.builder(
                             gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                                 crossAxisCount: 3, childAspectRatio: .8),
                             itemBuilder: (BuildContext context, int index) {
                               return Padding(
                                 padding: const EdgeInsets.all(5),
                                 child: FadeInUp(
                                   from: 20,
                                   duration: const Duration(milliseconds: 500),
                                   child: ClipRRect(
                                     borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                                     child: CachedNetworkImage(
                                       imageUrl: ConstantApi()
                                           .getImageUrl(state.recommendationsTv[index].backdropPath!),
                                       placeholder: (context, url) => Shimmer.fromColors(
                                         baseColor: Colors.grey[850]!,
                                         highlightColor: Colors.grey[800]!,
                                         child: Container(
                                           height:170,
                                           width: 120,
                                           decoration: BoxDecoration(
                                             color: Colors.yellowAccent,
                                             borderRadius: BorderRadius.circular(8.0),
                                           ),
                                         ),
                                       ),
                                       errorWidget: (context, url, error) => const Icon(Icons.error),
                                       fit: BoxFit.cover,
                                     ),
                                   ),
                                 ),
                               );
                             },

                             itemCount: state.recommendationsTv.length,

                           ),
                           ShowEpisodes(id: state.detilesTv!.id, seasonNumber: state.detilesTv!.numberOfSeasons)

                         ],
                       ),
                     ),
                   ),







                 ],
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
               height: ConfigSize.defaultSize! * 40 ,
               child: Center(child: Text(state.detilesTvMessage)));
       }
    }
    );


  }
}
