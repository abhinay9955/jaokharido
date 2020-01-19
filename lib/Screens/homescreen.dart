import 'package:flutter/material.dart';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:jaokharido/Blocs/themechanger.dart';
import 'package:jaokharido/Models/themes.dart';
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
      appBar: AppBar(title: Text("Shop4U"),backgroundColor: Theme.of(context).primaryColorDark,elevation: 10.0,centerTitle: true,actions: <Widget>[
        InkWell(
          child: Icon(Icons.search,color: Colors.white,),
          onTap: (){},
        ),
        SizedBox(width: 10.0,),
        InkWell(
          child: Icon(Icons.shopping_cart,color: Colors.white,),
          onTap: (){},
        ),
        SizedBox(width: 10.0,)
      ],),
      drawer: SafeArea(
        child: Container(
          height: double.infinity,
          width: MediaQuery.of(context).size.width/2,
          child: Drawer(
            child: Column(
              children: <Widget>[
                UserAccountsDrawerHeader(accountEmail: Text("kumarabhinay599@gmail.com"),accountName: Text("Abhinay Kumar"),
                currentAccountPicture: CircleAvatar(backgroundColor: Colors.grey,child: Icon(Icons.person,color: Colors.white,),),),
                ListTile(
                  leading: Switch(value: _switch,
                  onChanged: (value){
                       _theme.setTheme(value?MyThemes.Light():MyThemes.Red());
                       _switch=value;
                       _themetext=(value?"Light":"Red");
                       setState(() {});
                  },),
                  title: Text(_themetext),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
               Container(
                 padding: EdgeInsets.all(8.0),
                 height: 250.0,
                 child: Carousel(
                   overlayShadow: false,
                   boxFit: BoxFit.fitWidth,
                   borderRadius: true,
                   radius: Radius.circular(10.0),
                   dotBgColor: Colors.transparent,
                   images: [Image.asset("assets/images/c1.jpg"),Image.asset("assets/images/m1.jpeg"),Image.asset("assets/images/m2.jpg"),Image.asset("assets/images/w1.jpeg"),Image.asset("assets/images/w3.jpeg"),Image.asset("assets/images/w4.jpeg")],
                 ),
               ),

            Container(
              padding:EdgeInsets.all(10.0) ,
              height: 80.0,
              child: ListView.builder(

                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index)
                {
                  return Container(
                    height: 80.0,
                    width: 80.0,
                    child: Image.asset("assets/images/cats/accessories.png"),
                  );
                },
                itemCount: 5,
              ),
            )
          ],
        ),
      ),

    );
  }
}
