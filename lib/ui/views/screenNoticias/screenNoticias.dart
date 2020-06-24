
import 'package:flutter/material.dart';

class ScreenNoticiasPage extends StatefulWidget {
  @override
  _ScreenNoticiasPageState createState() => _ScreenNoticiasPageState();
}

class _ScreenNoticiasPageState extends State<ScreenNoticiasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('noticias'),
      ),
      body: Container(
        child: Text('hola mundo'),
      ),
    );
  }
}