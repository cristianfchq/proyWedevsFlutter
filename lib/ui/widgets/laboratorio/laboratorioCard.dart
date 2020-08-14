import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:covid19/core/models/laboratorio/laboratorioModel.dart';

class LaboratorioCard extends StatelessWidget {
  final Laboratorio laboratorioDetails;

  LaboratorioCard({@required this.laboratorioDetails});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('asdadsadsads');
        // Navigator.pushNamed(
        //   context,
        //   "/noticiasDetails",
        //   arguments: laboratorioDetails,
        // );
      },
      child: Padding(
        padding:
            const EdgeInsets.only(top: 20, left: 40, right: 40, bottom: 10),
        child: _cardTipo2(laboratorioDetails, context),
      ),
    );
  }

  Widget _cardTipo2(Laboratorio laboratorioDetails, BuildContext context) {
    final card = Container(
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 15.0, right: 15.0),
      color: Color(0xF6F9FC),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                laboratorioDetails.nombreLab,
                // textAlign: TextAlign.center,
                style: GoogleFonts.notoSans(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
              ),
              Text(
                laboratorioDetails.municipio,
                // textAlign: TextAlign.center,
                style: GoogleFonts.notoSans(
                  textStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
              ),
              // Text("data"),
            ],
          ),
          // FaIcon(
          //   FontAwesomeIcons.mapMarkedAlt,
          //   size: 35,
          //   color: Color(0xFF503CAA),
          // ),
          // Expanded(child: Text(' '),),
          Icon(
            Icons.place,
            size: 35,
            color: Color(0xFF503CAA),
          ),
        ],
      ),
    );
    return Container(
      // child: card,
      // width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color(0xFF503CAA),
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(5.0, 5.0),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: card,
      ),
    );
  }
}
