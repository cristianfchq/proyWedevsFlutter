import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:covid19/core/models/laboratorio/laboratorioModel.dart';

class LaboratorioCard extends StatefulWidget {
  final Laboratorio laboratorioDetails;
  
  LaboratorioCard({@required this.laboratorioDetails});

  @override
  _LaboratorioCardState createState() => _LaboratorioCardState();
}

class _LaboratorioCardState extends State<LaboratorioCard> {
  Future<void> _launched;

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _launchStatus(BuildContext context, AsyncSnapshot<void> snapshot) {
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      return const Text('');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _launched = _launchInBrowser(widget.laboratorioDetails.ubicacion);
        });
        // Navigator.pushNamed(
        //   context,
        //   "/noticiasDetails",
        //   arguments: laboratorioDetails,
        // );
      },
      child: Padding(
        padding:
            const EdgeInsets.only(top: 20, left: 40, right: 40, bottom: 10),
        child: _cardTipo2(widget.laboratorioDetails, context),
      ),
    );
  }

  Widget _cardTipo2(Laboratorio laboratorioDetails, BuildContext context) {
    final card = Container(
      padding:
          EdgeInsets.only(top: 10.0, bottom: 10.0, left: 15.0, right: 15.0),
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
          Icon(
            Icons.place,
            size: 35,
            color: Color(0xFF503CAA),
          ),
          // FutureBuilder<void>(future: _launched, builder: _launchStatus),
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
