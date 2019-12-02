import 'package:exampletododevindo/src/ui/page_login.dart';
import 'package:exampletododevindo/src/ui/page_splash.dart';
import 'package:exampletododevindo/src/utils/values/themes.dart' as theme;
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      //theme: ThemeData(primarySwatch: Colors.orange),
      theme: theme.theme,
      home: SplashScreen(),
    );
  }
}