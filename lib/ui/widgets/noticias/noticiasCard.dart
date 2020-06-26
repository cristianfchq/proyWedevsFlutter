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
        // Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetails(product: productDetails)));
        // Navigator.pushNamed(context, '/productDetails');
        // Navigator.pushNamed(context, "/productDetails",
        //     arguments: departmentDetails);
        Navigator.pushNamed(context, "/noticiasDetails",
            arguments: noticiasDetails);
      },
      child: Padding(
        padding:
            const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 20),
        child: _cardTipo2(noticiasDetails),
      ),
    );
    
    // GestureDetector(
    //   onTap: () {
    //     // Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetails(product: productDetails)));
    //     // Navigator.pushNamed(context, '/productDetails');
    //     Navigator.pushNamed(context, "/noticiasDetails",
    //         arguments: noticiasDetails);
    //   },
    //   child: Padding(
    //     padding: EdgeInsets.all(8),
    //     child: Card(
    //       elevation: 5,
    //       child: Container(
    //         // height: MediaQuery.of(context).size.height * 0.45,
    //         width: MediaQuery.of(context).size.width * 0.9,
    //         child: Column(
    //           children: <Widget>[
    //             // Hero(
    //             //   tag: noticiasDetails.id,
    //             //   child: Image.asset(
    //             //     'assets/${productDetails.img}.jpg',
    //             //     height: MediaQuery.of(context).size.height * 0.35,
    //             //   ),
    //             // ),

    //             Text(
    //               noticiasDetails.titulo,
    //               textAlign: TextAlign.justify,
    //               style: TextStyle(
    //                 fontWeight: FontWeight.w900,
    //                 fontSize: 22,
    //                 fontStyle: FontStyle.italic,
    //               ),
    //             ),
    //             Text(
    //               noticiasDetails.resumen.replaceAll("rrrrr", "\n\n"),
    //               style: TextStyle(
    //                 fontWeight: FontWeight.w900,
    //                 fontSize: 22,
    //                 fontStyle: FontStyle.italic,
    //                 color: Colors.orangeAccent,
    //               ),
    //               textAlign: TextAlign.justify,
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }

  Widget _cardTipo2(Noticias noticiasDetails) {
    
    

    final card = Container(
      // clipBehavior: Clip.antiAlias,
      // elevation: 5.0,
      // color: Colors.blue[100],
      width: 400,
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
        
            CachedNetworkImage(
              imageUrl: noticiasDetails.img,
              placeholder: (context, url) => Container(
                height: 250,
                child: Image.asset(
                  'assets/Preloader_5_64x164.gif',
                  fit: BoxFit.none,
                ),
              ),
              fadeInDuration: Duration(
                milliseconds: 200,
              ),
              height: 250.0,
              fit: BoxFit.fill,
            ),
          
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              children: <Widget>[
                Text(
                  noticiasDetails.titulo,
                  style: GoogleFonts.notoSans(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
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
                      hintStyle: TextStyle(fontSize: 18, color: Colors.black54)
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(child: Text('')),
                    FaIcon(FontAwesomeIcons.chevronCircleRight, size: 35, color: Color(0xFFFFCE47),),
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
}
