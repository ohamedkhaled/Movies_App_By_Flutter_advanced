import 'package:flutter/material.dart';
import 'package:movies_app/Core/utils/Config_Size.dart';
import 'package:movies_app/Core/utils/Constants_App.dart';

class CustomIconBar extends StatelessWidget{

 final IconData icon;
 final Function() onIcon ;

 final double elevation;

 CustomIconBar({required this.icon,required this.onIcon,required this.elevation});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onIcon,
      child: Material(
        elevation: elevation,
        shadowColor: Colors.white,
        color: KscondryColor,
        borderRadius: BorderRadius.circular(20),

        child: Container(
          width: ConfigSize.defaultSize!*7,
          height:ConfigSize.defaultSize!*4 ,
          decoration: BoxDecoration(
            color: KscondryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(
            icon,color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}

