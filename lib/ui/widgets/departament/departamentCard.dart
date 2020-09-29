import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:covid19/core/models/departmentModel/departmentModel.dart';

class DepartmentCard extends StatelessWidget {
  final Department departmentDetails;

  DepartmentCard({@required this.departmentDetails});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetails(product: productDetails)));
        // Navigator.pushNamed(context, '/productDetails');
        // Navigator.pushNamed(context, "/productDetails",
        //     arguments: departmentDetails);
        Navigator.pushNamed(context, "/departmentDetails",
            arguments: departmentDetails);
      },
      child: Padding(
        padding:
            const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 20),
        child: _cardTipo2(departmentDetails),
      ),
    );
  }

  String numberFormat(double x) {
    List<String> parts = x.toString().split('.');
    RegExp re = RegExp(r'\B(?=(\d{3})+(?!\d))');

    parts[0] = parts[0].replaceAll(re, ',');
    if (parts.length == 1) {
      parts.add('00');
    } else {
      parts[1] = parts[1].padRight(2, '0').substring(0, 2);
    }
    return parts.join('.');
  }

  Widget _cardTipo2(Department departmentDetails) {
    var a = double.parse(departmentDetails.confirmados);
    Text cantidadTotalCasos = Text(
      numberFormat(a).split('.')[0],
      style: GoogleFonts.notoSans(
        textStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
      ),
    );

    final card = Container(
      // clipBehavior: Clip.antiAlias,
      // elevation: 5.0,
      // color: Colors.blue[100],
      color: Colors.blue[50],
      width: 260,
      child: Column(
        children: <Widget>[
          // FadeInImage(
          //   image: NetworkImage(departmentDetails.img),
          //   placeholder: AssetImage('assets/jar-loading.gif'),
          //   fadeInDuration: Duration(
          //     milliseconds: 200,
          //   ),
          //   height: 250.0,
          //   fit: BoxFit.cover,
          // ),
          Hero(
            tag: departmentDetails.id,
            child: CachedNetworkImage(
              imageUrl: departmentDetails.img,
              placeholder: (context, url) => Container(
                height: 250,
                child: Image.asset(
                  'assets/Preloader_8_128x128.gif',
                  fit: BoxFit.none,
                ),
              ),
              fadeInDuration: Duration(
                milliseconds: 200,
              ),
              height: 250.0,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      'Confirmados',
                      style: GoogleFonts.notoSans(
                        textStyle: TextStyle(
                          color: Color(0xFF503CAA),
                          // fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    _containerCases(cantidadTotalCasos),
                  ],
                ),
                FaIcon(
                      FontAwesomeIcons.chevronCircleRight,
                      size: 35,
                      color: Color(0xFF503CAA),
                    ),
              ],
            ),
          ),
        ],
      ),
    );
    return Container(
      // child: card,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.blue[50],
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

  Widget _containerCases(Text numberCases) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color(0xFF503CAA),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
        child: numberCases,
      ),
    );
  }
}
