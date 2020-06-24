
import 'package:flutter/material.dart';
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

  List<Noticias> noticias;

  @override
  Widget build(BuildContext context) {

    final productProvider = Provider.of<CRUDModelNoticias>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Noticias'),
      ),
      body: Container(
        child: StreamBuilder(
          stream: productProvider.fetchProductsAsStream(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              noticias = snapshot.data.documents
                  .map((doc) => Noticias.fromMap(doc.data, doc.documentID))
                  .toList();
              // print(products[0].price);
              return ListView.builder(
                itemCount: noticias.length,
                itemBuilder: (buildContext, index) =>
                    NoticiasCard(noticiasDetails: noticias[index]),
              );
            } else {
              return Text('fetching');
            }
          },
        ),
      ),
    );
  }
}