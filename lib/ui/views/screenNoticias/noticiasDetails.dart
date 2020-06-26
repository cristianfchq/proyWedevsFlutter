
import 'package:covid19/core/models/noticiasModel/noticiasModel.dart';
import 'package:flutter/material.dart';

class NoticiasDetailsPage extends StatefulWidget {

  final Noticias noticiasRecived;

  NoticiasDetailsPage({@required this.noticiasRecived});

  @override
  _NoticiasDetailsPageState createState() => _NoticiasDetailsPageState();
}

class _NoticiasDetailsPageState extends State<NoticiasDetailsPage> {
  
  List<Noticias> noticias;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.noticiasRecived.titulo),
      ),
    );
  }
}