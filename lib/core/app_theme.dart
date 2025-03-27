import 'package:flutter/material.dart';

import 'app_color_palette.dart';

final ThemeData appTheme = ThemeData(
  appBarTheme: AppBarTheme(backgroundColor: AppColors.backgroundDark),
  hintColor: Colors.green,
  cardTheme: CardTheme(
    color: Colors.white,
    shadowColor: Colors.grey,
    elevation: 5.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
  ),
  textTheme: TextTheme(
    titleLarge: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
    bodyMedium: TextStyle(fontSize: 15.0),
    bodySmall: TextStyle(fontSize:  12.0)
  ), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(surface: Colors.white),
);