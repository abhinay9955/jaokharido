import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jaokharido/Screens/homescreen.dart';

import 'loginscreen.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance.currentUser().then((user){
       if(user==null)
         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginScreen()));
       else
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage(user)));

    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Image.asset("assets/images/splash.jpg",fit: BoxFit.fill,),
    );
  }
}
