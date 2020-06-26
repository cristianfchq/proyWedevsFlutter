import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:covid19/core/viewmodels/CRUDModelNoticias.dart';
import 'package:covid19/core/models/noticiasModel/noticiasModel.dart';
import 'package:covid19/ui/widgets/noticias/noticiasCard.dart';

class ScreenNoticiasPage extends StatefulWidget {
  @override
  _ScreenNoticiasPageState createState() => _ScreenNoticiasPageState();
}

class _ScreenNoticiasPageState extends State<ScreenNoticiasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _myBody(),
    );
  }

  Widget _myBody() {
    return Container(
      child: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              // color: Colors.yellow.withOpacity(0.5),
              height: MediaQuery.of(context).size.height - 56.0,
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: _secondPartBody(),
              ),
            ),
            _firstParteBody(),
          ],
        ),
      ),
    );
  }

  Widget _firstParteBody() {
    return Container(
      // color: Color(0xFF503CAA),
      color: Colors.white.withOpacity(0.0),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            // height: 200,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              ),
              color: Color(0xFF503CAA),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: _titulo(),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // Center(
                //   child: Icon(
                //     Icons.star,
                //     color: Colors.white,
                //     size: 35,
                //   ),
                // ),
                Center(
                  child: FaIcon(
                    FontAwesomeIcons.newspaper,
                    size: 35,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _titulo() {
    return SafeArea(
      child: Container(
        child: Text(
          "Información",
          style: GoogleFonts.notoSans(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _secondPartBody() {
    List<Noticias> noticias;
    final productProvider = Provider.of<CRUDModelNoticias>(context);
    return Container(
      child: StreamBuilder(
        stream: productProvider.fetchProductsAsStream(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            noticias = snapshot.data.documents
                .map((doc) => Noticias.fromMap(doc.data, doc.documentID))
                .toList();
            // print(products[0].price);
            return Padding(
              padding: const EdgeInsets.only(top: 100),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: noticias.length,
                itemBuilder: (buildContext, index) =>
                    NoticiasCard(noticiasDetails: noticias[index]),
              ),
            );
          } else {
            return Text('fetching');
          }
        },
      ),
    );
  }
}
