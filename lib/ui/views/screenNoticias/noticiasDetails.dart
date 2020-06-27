import 'package:cached_network_image/cached_network_image.dart';
import 'package:covid19/core/models/noticiasModel/noticiasModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      // appBar: AppBar(
      //   title: Text(widget.noticiasRecived.titulo),
      // ),
      body: myBody(),
    );
  }

  Widget myBody() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // tag: widget.noticiasRecived.id,
            Hero(
              tag: widget.noticiasRecived.id + 'imagen',
              child: SafeArea(child: _imagenNoticia()),
            ),
            Hero(
              tag: widget.noticiasRecived.id + 'titulo',
              child: _tituloNoticia(),
            ),
            _resumenNoticia(),
          ],
        ),
      ),
    );
  }

  Widget _imagenNoticia() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 350,
      // child: Hero(
      //         tag: widget.noticiasRecived.id,
      child: CachedNetworkImage(
        imageUrl: widget.noticiasRecived.img,
        placeholder: (context, url) => Container(
          height: 250,
          child: Image.asset(
            'assets/Preloader_1_64x64.gif',
            fit: BoxFit.cover,
          ),
        ),
        fadeInDuration: Duration(
          milliseconds: 200,
        ),
        height: 250.0,
        fit: BoxFit.fill,
      ),
      // ),
    );
  }

  Widget _tituloNoticia() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
        child: Text(
          widget.noticiasRecived.titulo,
          textAlign: TextAlign.center,
          style: GoogleFonts.notoSans(
            textStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }

  Widget _resumenNoticia() {
    return Container(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 20),
        child: Text(
          widget.noticiasRecived.resumen.replaceAll("rrrrr", "\n\n"),
          textAlign: TextAlign.justify,
          style: GoogleFonts.notoSans(
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
