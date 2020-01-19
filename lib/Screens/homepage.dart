import 'package:flutter/material.dart';
import 'package:jaokharido/Blocs/themechanger.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 var  _switch=false;
 var _themetext="Dark";
  @override
  Widget build(BuildContext context) {
    final _theme=Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Jai Kharido"),backgroundColor: Theme.of(context).primaryColorDark,),
      drawer: SafeArea(
        child: Container(
          height: double.infinity,
          width: MediaQuery.of(context).size.width/2,
          child: Drawer(
            child: Column(
              children: <Widget>[

                ListTile(
                  leading: Switch(value: _switch,
                  onChanged: (value){
                       _theme.setTheme(value?ThemeData.light():ThemeData.dark());
                       _switch=value;
                       _themetext=(value?"Light":"Dark");
                       setState(() {});
                  },),
                  title: Text(_themetext),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
