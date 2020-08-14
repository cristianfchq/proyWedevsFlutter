
import 'package:covid19/core/models/laboratorio/laboratorioModel.dart';
import 'package:covid19/core/viewmodels/CRUDModelLaboratorio.dart';
import 'package:covid19/ui/widgets/laboratorio/laboratorioCard.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';



class LocatePlacePage extends StatefulWidget {
  @override
  _LocatePlacePageState createState() => _LocatePlacePageState();
}

class _LocatePlacePageState extends State<LocatePlacePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myAppBar(),
      body: _myBody(),
    );
  }

  Widget _myAppBar() {
    return AppBar(
      title: Text("Laboratorios Autorizados covid-19"),
      backgroundColor: Color(0xFF503CAA),
    );
  }

  Widget _myBody() {
    List<Laboratorio> laboratorios;
    final productProvider = Provider.of<CRUDModelLaboratorio>(context);
    return Container(
        child: StreamBuilder(
          stream: productProvider.fetchProductsAsStream(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              laboratorios = snapshot.data.documents
                  .map((doc) => Laboratorio.fromMap(doc.data, doc.documentID))
                  .toList();
              // print(products[0].price);
              return ListView.builder(
                itemCount: laboratorios.length,
                itemBuilder: (buildContext, index) =>
                    LaboratorioCard(laboratorioDetails: laboratorios[index]),
              );
            } else {
              return Text('fetching');
            }
          },
        ),
      );
  }
}