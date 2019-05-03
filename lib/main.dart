import 'package:flutter/material.dart';
import 'package:transport_app/pages/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Transport App",
      theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Colors.yellowAccent
      ),
      home: LoginPage(),
    );
  }
}
