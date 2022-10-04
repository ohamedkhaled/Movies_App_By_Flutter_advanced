

import 'package:flutter/material.dart';
import 'package:movies_app/Core/utils/Config_Size.dart';
import 'package:movies_app/Core/utils/Constants_App.dart';
import 'Custom_Icon_Bar.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        color: KscondryColor,
      ),
      child: BottomAppBar(
        elevation: 0,
        color: Colors.transparent ,
        child:  SizedBox(
          height: ConfigSize.defaultSize!*8,
          width: ConfigSize.screenWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround  ,
            children: [
              CustomIconBar(icon: Icons.movie,onIcon: (){

              } , elevation: 10),
              CustomIconBar(icon: Icons.tv,onIcon: (){
              } ,elevation: 0 )

            ],
          ),
        ),
      ) ,
    );
  }
}