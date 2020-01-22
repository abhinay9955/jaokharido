import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:jaokharido/Blocs/themechanger.dart';
import 'package:jaokharido/Models/themes.dart';
import 'package:jaokharido/Screens/loginscreen.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {

  FirebaseUser user;

  HomePage(this.user);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 var  _switch=true;
 var _themetext="Light";

 List<String> datas;

 @override
  void initState(){
    // TODO: implement initState
    super.initState();
    datas=List<String>();

  }

  @override
  Widget build(BuildContext context) {
    final _theme=Provider.of<ThemeChanger>(context);
    var listitem = Padding(
            padding: const EdgeInsets.all(8.0),
//              child: GridView(
//                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//                children: <Widget>[
                              child:Container(
                                height: 200.0,
                                child: Card(
                                  elevation: 8.0,
                                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.all(Radius.circular(8.0))),
                                  child: Image.asset("assets/images/products/blazer1.jpeg",fit: BoxFit.fill,),

                                ),
                              ),);
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
          width: MediaQuery.of(context).size.width/1.5,
          child: Drawer(
            child: Column(
              children: <Widget>[
                UserAccountsDrawerHeader(accountEmail: Text(widget.user.email),accountName: Text(widget.user.displayName),
                currentAccountPicture: CircleAvatar(backgroundColor: Colors.grey,backgroundImage: NetworkImage(widget.user.photoUrl) ,),),
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
      body: Column(
        children: <Widget>[

          Container(
            padding: EdgeInsets.all(8.0),
            height: MediaQuery.of(context).size.height/3,
            child: Carousel(
              overlayShadow: false,
              boxFit: BoxFit.fitWidth,
              borderRadius: true,
              radius: Radius.circular(10.0),
              dotBgColor: Colors.transparent,
              images: [Image.asset("assets/images/c1.jpg",fit: BoxFit.cover,),Image.asset("assets/images/m1.jpeg",fit: BoxFit.cover),Image.asset("assets/images/m2.jpg",fit: BoxFit.cover),Image.asset("assets/images/w1.jpeg",fit: BoxFit.cover),Image.asset("assets/images/w3.jpeg",fit: BoxFit.cover),Image.asset("assets/images/w4.jpeg",fit: BoxFit.cover)],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 80.0,
            child: ListView(

              scrollDirection: Axis.horizontal,
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 80.0,
                    width: 80.0,
                    child: Image.asset("assets/images/cats/accessories.png"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 80.0,
                    width: 80.0,
                    child: Image.asset("assets/images/cats/dress.png"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 80.0,
                    width: 80.0,
                    child: Image.asset("assets/images/cats/formal.png"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 80.0,
                    width: 80.0,
                    child: Image.asset("assets/images/cats/informal.png"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 80.0,
                    width: 80.0,
                    child: Image.asset("assets/images/cats/jeans.png"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 80.0,
                    width: 80.0,
                    child: Image.asset("assets/images/cats/shoe.png"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 80.0,
                    width: 80.0,
                    child: Image.asset("assets/images/cats/tshirt.png"),
                  ),
                ),

              ],
            ),
          ),

          Expanded(
            child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context,index)=> listitem,
              itemCount: 20,
            ),
          )
    ]));




  }
}
