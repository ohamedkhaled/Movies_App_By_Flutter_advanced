import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/Movies_Modul/Presentation/Screens/Movies_Screen.dart';
import 'package:movies_app/Tv_Modul/Presentation/Screens/TvScreen.dart';
import 'Core/Widgets/Custom_Icon_Bar.dart';
import 'Core/utils/Config_Size.dart';
import 'Core/utils/Constants_App.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState()
   {
    return  _HomeScreen ();
  }
}

class _HomeScreen  extends State<HomeScreen> {
  int _selectedIndex = 0;
  bool switCh = true;

  static const List<Widget> _widgetOptions = <Widget>[
    MoviesScreen(),
    TvScreen()


  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if(index ==0){
        switCh = true;
      }else{
        switCh = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ConfigSize().init(context);
   return Scaffold(
      body:_widgetOptions.elementAt(_selectedIndex) ,
     bottomNavigationBar: Container(
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
                 _onItemTapped(0);
               } , elevation: switCh?10:0),
               CustomIconBar(icon: Icons.tv,onIcon: (){
                 _onItemTapped(1);
               } ,elevation: switCh?0:10 )

             ],
           ),
         ),
       ) ,
     ),
    );
  }
}