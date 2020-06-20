import 'package:flutter/material.dart';
import 'base/rebasetabbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        highlightColor: Color(0x00FFFFFF),
        splashColor: Color(0x00FFFFFF),
        brightness: Brightness.light,
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ScaffoldRoute(),
    );
  }
}


