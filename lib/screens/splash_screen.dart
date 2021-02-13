import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:think_delivery_driver/model/user_model.dart';
import 'package:think_delivery_driver/screens/landing_screen.dart';
import 'package:think_delivery_driver/screens/login_driver_screen.dart';
class SplashScreen extends StatefulWidget {
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: ListView
(
            children: <Widget>[

              SizedBox(height: 15),
              Image.asset('images/globe_top.png',height:290),
              Image.asset('images/app_icon.png',width:120,height: 120),
              SizedBox(height: 15),
              Image.asset('images/globe_bottom.png',height:290)
              
              
              

            ],
          )
        ));
  }

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => UserModel.accessToken==null?DriverLoginScreen():MainScreen())));

  }
}
