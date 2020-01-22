import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jaokharido/Models/themes.dart';
import 'package:jaokharido/Screens/loginscreen.dart';
import 'package:provider/provider.dart';

import 'Blocs/themechanger.dart';
import 'Screens/homescreen.dart';
import 'Screens/welcome.dart';

FirebaseUser user;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
 SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
 runApp(MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_)=> ThemeChanger(MyThemes.Light().copyWith(scaffoldBackgroundColor: Colors.white)),
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
      home: WelcomePage(),
      title: "Jao Kharido",
    );
  }
}


