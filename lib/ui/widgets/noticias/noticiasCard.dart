import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:covid19/core/models/noticiasModel/noticiasModel.dart';

class NoticiasCard extends StatelessWidget {
  final Noticias noticiasDetails;

  NoticiasCard({@required this.noticiasDetails});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/noticiasDetails",
            arguments: noticiasDetails);
      },
      child: Padding(
        padding:
            const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 20),
        child: _cardTipo2(noticiasDetails, context),
      ),
    );
  }

  Widget _cardTipo2(Noticias noticiasDetails, BuildContext context) {
    final card = Container(
      child: Column(
        children: <Widget>[
          Hero(
            tag: noticiasDetails.id + 'imagen',
            child: CachedNetworkImage(
              imageUrl: noticiasDetails.img,
              placeholder: (context, url) => Container(
                height: 230,
                width: MediaQuery.of(context).size.width - 30,
                child: Image.asset(
                  'assets/Preloader_1_64x64.gif',
                  fit: BoxFit.none,
                ),
              ),
              fadeInDuration: Duration(
                milliseconds: 200,
              ),
              height: 230.0,
              width: MediaQuery.of(context).size.width - 30,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              children: <Widget>[
                Hero(
                  tag: noticiasDetails.id + 'titulo',
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      noticiasDetails.titulo,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.notoSans(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          enabled: false,
                          hintText: noticiasDetails.resumen,
                          hintStyle:
                              TextStyle(fontSize: 18, color: Colors.black54)),
                    ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(child: Text('')),
                    FaIcon(
                      FontAwesomeIcons.chevronCircleRight,
                      size: 35,
                      color: Color(0xFF503CAA),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                  ],
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
        ],
      ),
    );
    return Container(
      // child: card,
      // width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color(0xFF503CAA),
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(5.0, 10.0),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );
  }
}
