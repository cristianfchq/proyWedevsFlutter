import 'package:flutter/material.dart';

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
      // Padding(
      //   padding: EdgeInsets.all(8),
      //   child: Card(
      //     elevation: 5,
      //     child: Container(
      //       height: MediaQuery.of(context).size.height * 0.45,
      //       width: MediaQuery.of(context).size.width * 0.9,
      //       child: Column(
      //         children: <Widget>[
      //           Hero(
      //             tag: departmentDetails.id,
      //             child: Image.asset(
      //               'assets/pngImage/clean.png',
      //               height: MediaQuery.of(context).size.height * 0.35,
      //             ),
      //           ),
      //           Padding(
      //             padding: EdgeInsets.all(16),
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: <Widget>[
      //                 Text(
      //                   departmentDetails.nombre,
      //                   style: TextStyle(
      //                       fontWeight: FontWeight.w900,
      //                       fontSize: 22,
      //                       fontStyle: FontStyle.italic),
      //                 ),
      //                 Text(
      //                   departmentDetails.confirmados,
      //                   style: TextStyle(
      //                       fontWeight: FontWeight.w900,
      //                       fontSize: 22,
      //                       fontStyle: FontStyle.italic,
      //                       color: Colors.orangeAccent),
      //                 ),
      //               ],
      //             ),
      //           )
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }

  String numberFormat(double x) {
    List<String> parts = x.toString().split('.');
    RegExp re = RegExp(r'\B(?=(\d{3})+(?!\d))');

    parts[0] = parts[0].replaceAll(re, ',');
    if (parts.length == 1) {
      parts.add('00');
    } 
    else {
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
      width: 260,
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage(departmentDetails.img),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(
              milliseconds: 200,
            ),
            height: 250.0,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              children: <Widget>[
                Text(
                  'Casos Confirmados',
                  style: GoogleFonts.notoSans(
                    textStyle: TextStyle(
                      color: Color(0xFFFF4D4D),
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                _containerCases(cantidadTotalCasos),
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
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
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
        color: Color(0xFFFFCE47),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
        child: numberCases,
      ),
    );
  }

  
}
