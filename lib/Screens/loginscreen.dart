import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jaokharido/Screens/homescreen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Shop4U",),centerTitle: true,),
      body: LoginBody(),
    );
  }
}


class LoginBody extends StatefulWidget {
  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlutterLogo(colors: Theme.of(context).primaryColor,size: MediaQuery.of(context).size.width/3,),
          SizedBox(height: 20.0,),
          Container(
            width: 100.0,
            child: FlatButton(
              color: Colors.blue,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("G",style:TextStyle(color: Colors.red,fontWeight: FontWeight.bold,) ,),
                  Text("sign in")

                ],
              ),
              onPressed: (){
                    _signin().then((user){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage(user)));
                    });
              },
            ),
          )
        ],
      ),
    );
  }

  Future<FirebaseUser> _signin () async
  {
     FirebaseAuth _auth=FirebaseAuth.instance;
     GoogleSignIn googleSignIn=GoogleSignIn();
     final GoogleSignInAccount googleSignInAccount=await googleSignIn.signIn();
     final GoogleSignInAuthentication googleSignInAuthentication=await googleSignInAccount.authentication;
     final AuthCredential authCredential=GoogleAuthProvider.getCredential(idToken: googleSignInAuthentication.idToken, accessToken: googleSignInAuthentication.accessToken);
     final AuthResult authResult=await _auth.signInWithCredential(authCredential);
     FirebaseUser user=authResult.user;
     return user;
  }
}
