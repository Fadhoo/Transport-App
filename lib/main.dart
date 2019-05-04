import 'package:flutter/material.dart';

import 'pages/login.dart';
import 'pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: <String, WidgetBuilder>{
        "/": (BuildContext context) => LoginPage(),
        "/home": (BuildContext context) => HomePage(),
      },
      title: "Transport App",
      theme: ThemeData(
          primarySwatch: Colors.teal, accentColor: Colors.yellowAccent),
    );
  }
}
