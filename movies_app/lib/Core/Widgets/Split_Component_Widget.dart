import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/Config_Size.dart';


class SplitComponent extends StatelessWidget{
  final  void Function(BuildContext context) seeMore;
  final String title ;
  SplitComponent({required this.title,required this.seeMore});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: ConfigSize.defaultSize! * 1.5,
          right: ConfigSize.defaultSize! * 1.5,
          left: ConfigSize.defaultSize! * 1.5,
          bottom: ConfigSize.defaultSize!),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$title",
            style: GoogleFonts.poppins(
                fontSize: 19,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.15,
                color: Colors.white),
          ),
          InkWell(
              onTap: () {
                //action
              },
              child: Row(children: [
                TextButton(
                    onPressed: (){ seeMore(context);},
                    child:Text( "see more",
                        style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    )
                    )),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 16,
                )
              ]))
        ],
      ),
    );
  }
}