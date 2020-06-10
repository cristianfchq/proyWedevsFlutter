import 'package:flutter/material.dart';
import 'package:covid19/principalScreen.dart';
import 'package:covid19/graphScreenBolivia.dart';
import 'package:covid19/bottomNavigationInferior.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: BottomNavigationInferior(),
    );
  }
}