import 'package:flutter/material.dart';
import 'package:jaokharido/Models/themes.dart';
import 'package:provider/provider.dart';

import 'Blocs/themechanger.dart';
import 'Screens/homescreen.dart';

void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_)=> ThemeChanger(MyThemes.Dark()),
      child: MaterialAppWithTheme()
    );  }
}

class MaterialAppWithTheme extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    final _theme=Provider.of<ThemeChanger>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _theme.getTheme(),
      home: HomePage(),
      title: "Jao Kharido",
    );
  }
}


