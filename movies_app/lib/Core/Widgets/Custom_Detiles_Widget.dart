
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/Tv_Modul/Domin/Enities/Genres.dart';

import '../utils/Config_Size.dart';
import '../utils/Methods.dart';

class CustomDetilesWidget extends  StatelessWidget{
  final String name ;
  final String firstAirDate;
  final  double voteAverage ;
  final int episodeRunTime ;
  final String overView ;
   List<GenresEntitiesTv> genres ;


  CustomDetilesWidget(
      {required this.name,
      required this.firstAirDate,
      required this.voteAverage,
        required this.episodeRunTime,
      required this.overView,
        required this.genres,
      });

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: Duration(milliseconds: 500),
      from: 20, //control scal of  animation
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,
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
                    firstAirDate.split('-')[0],
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
                      (voteAverage / 2)
                          .toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(width: 4.0),
                    Text(
                      '(${voteAverage})',
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
                  Methods.showFormatRunTime(episodeRunTime),
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
            SizedBox(height: ConfigSize.defaultSize! * 1.5,),
            Text(
              overView,
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: ConfigSize.defaultSize! * 1.5,),
            Text(
              '${genres}: ${Methods.showGenres2(genres)}',
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

    );
  }
}