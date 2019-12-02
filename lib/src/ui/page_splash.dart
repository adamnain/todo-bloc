import 'dart:async';
import 'dart:io';
import 'package:exampletododevindo/src/data/session.dart';
import 'package:exampletododevindo/src/ui/page_home.dart';
import 'package:exampletododevindo/src/ui/page_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int count = 3;
  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  Future navigationPage() async {
      bool isLoggedIn = await Session.isLoggedIn();
      if (isLoggedIn) {
        setState(() {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => MyHomePage(
                        title: "Home",
                      )));
        });
      } else {
        setState(() {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => Login(
                        title: "Login",
                      )));
        });
      }
    }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Image.asset('assets/images/pragma-logo.png'),
      ),
    );
  }


}
