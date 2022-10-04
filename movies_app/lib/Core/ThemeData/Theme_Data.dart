

import 'package:flutter/material.dart';

import '../utils/Constants_App.dart';

ThemeData getThemeDataDark()=>ThemeData.dark().copyWith(

  scaffoldBackgroundColor: KmainColor,
  appBarTheme: AppBarTheme(
    centerTitle: true,

  )
);

