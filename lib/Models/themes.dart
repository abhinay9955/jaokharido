import 'package:flutter/material.dart';

class MyThemes
{

  static ThemeData Light()
  {
    return ThemeData.light();
  }

  static ThemeData Dark()
  {
      return ThemeData.dark();
  }

  static ThemeData Red()
  {
    return ThemeData.light().copyWith(primaryColor: Colors.redAccent,primaryColorDark: Colors.red);
  }





}