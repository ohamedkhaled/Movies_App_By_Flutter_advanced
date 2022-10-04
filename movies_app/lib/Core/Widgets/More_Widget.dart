

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/Core/Widgets/CachImageWidght.dart';

import '../utils/Api_Helper/Constant_Api.dart';
import '../utils/Config_Size.dart';
import '../utils/Constants_App.dart';


class MoreWidght extends StatelessWidget{
  final String  backdropPath ;
  final String  title ;
  final String  releaseDate ;
  final double voteAverage ;
  final  String overview;
  final int id ;


  MoreWidght({required this.backdropPath, required this.title, required this.releaseDate,required this.voteAverage,
      required this.overview, required this.id});

  @override
  Widget build(BuildContext context) {

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 12 ),
        child: Container(
          height: ConfigSize.defaultSize!*20,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: KmainColor
          ),
          child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20), // Image border
                      child:  CachImageWidght(url:  ConstantApi().getImageUrl(
                          backdropPath),width: ConfigSize.defaultSize! * 10,height: ConfigSize.defaultSize! * 20,),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title,style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.1,
                        )),

                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 2.0,
                                horizontal: 8.0,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.red[400],
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: Text(
                                releaseDate.split('-')[0],
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(width:15 ,),
                            Icon(Icons.star ,color: Colors.yellowAccent),
                            Text(
                              (voteAverage/ 2)
                                  .toStringAsFixed(1),
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.2,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20,),
                        Text(
                          '${overview.substring(0,70)}...',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.2,
                          ),
                        )



                      ],
                    ),
                  ),
                ),
              ]),
        )

    );
  }

}