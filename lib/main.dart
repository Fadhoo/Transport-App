import 'package:flutter/material.dart';
import 'package:transport_app/pages/search.dart';

import 'pages/login.dart';
import 'pages/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: <String, WidgetBuilder>{
        "/": (BuildContext context) => LoginPage(),
        "/index": (BuildContext context) => IndexPage(),
        "/search": (BuildContext context) => SearchPage(),
      },
      title: "Transport App",
      theme: ThemeData(
          primaryColor: Colors.green,
          accentColor: Colors.yellowAccent),
    );
  }
}
