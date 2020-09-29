import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// void main() => runApp(MyApp());
void main() {
  // add this, and it should be the first line in main method
  WidgetsFlutterBinding.ensureInitialized();

  // rest of your app code
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  final databaseReference = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('FireStore Demo'),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              RaisedButton(
                child: Text('Create Record'),
                onPressed: () {
                  createRecord();
                },
              ),
              RaisedButton(
                child: Text('View Record'),
                onPressed: () {
                  getData();
                },
              ),
              RaisedButton(
                child: Text('Update Record'),
                onPressed: () {
                  updateData();
                },
              ),
              RaisedButton(
                child: Text('Delete Record'),
                onPressed: () {
                  deleteData();
                },
              ),
              RaisedButton(
                child: Text('Create Cities'),
                onPressed: () {
                  createCities();
                },
              ),
              RaisedButton(
                child: Text('View Cities with state CA'),
                onPressed: () {
                  getCities();
                },
              ),
              RaisedButton(
                child: Text('get all capitals'),
                onPressed: () {
                  getCapitals();
                },
              ),
              
              RaisedButton(
                child: Text('Update Record'),
                onPressed: () {
                  updateData();
                },
              ),
              RaisedButton(
                child: Text('Delete Record'),
                onPressed: () {
                  deleteData();
                },
              ),
            ],
          ),
        ), //center
      ),
    );
  }

  void createRecord() async {
    await databaseReference.collection("books").document("1").setData({
      'title': 'Mastering Flutter',
      'description': 'Programming Guide for Dart'
    });

    DocumentReference ref = await databaseReference.collection("books").add({
      'title': 'Flutter in Action',
      'description': 'Complete Programming Guide to learn Flutter'
    });
    print(ref.documentID);
  }

  void getData() {
    databaseReference
        .collection("books")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) => print('${f.data}}'));
    });
  }

  void getDataWithWhere() {
    databaseReference
        .collection("books")
        .where('title', isEqualTo: "Flutter in Action")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) => print('${f.data}}'));
    });
  }
  

  void updateData() {
    try {
      databaseReference
          .collection('books')
          .document('1')
          .updateData({'description': 'Head First Flutter'});
    } catch (e) {
      print(e.toString());
    }
  }

  void deleteData() {
    try {
      databaseReference.collection('books').document('1').delete();
    } catch (e) {
      print(e.toString());
    }
  }

  // otras consultas con otros datos y otra colleccion

  void createCities() async {
    
    var citiesRef = databaseReference.collection("cities");

    await citiesRef.document("SF").setData({
      "name": "San Francisco",
      "state": "CA",
      "country": "USA",
      "capital": false,
      "population": 860000,
      "regions": ["west_coast", "norcal"]
    });
    citiesRef.document("LA").setData({
      "name": "Los Angeles",
      "state": "CA",
      "country": "USA",
      "capital": false,
      "population": 3900000,
      "regions": ["west_coast", "socal"]
    });
    citiesRef.document("DC").setData({
      "name": "Washington D.C.",
      "country": "USA",
      "capital": true,
      "population": 680000,
      "regions": ["east_coast"]
    });
    citiesRef.document("TOK").setData({
      "name": "Tokyo",
      "country": "Japan",
      "capital": true,
      "population": 9000000,
      "regions": ["kanto", "honshu"]
    });
    citiesRef.document("BJ").setData({
      "name": "Beijing",
      "country": "China",
      "capital": true,
      "population": 21500000,
      "regions": ["jingjinji", "hebei"]
    });
  }

  // La siguiente consulta muestra todas las ciudades con el estado CA:

  void getCities() async {
    // Create a reference to the cities collection
    var citiesRef = databaseReference.collection("cities");
    // Create a query against the collection.
    var query = citiesRef.where("state", isEqualTo: "CA");
    // TODO: Consultas Simples
    // citiesRef.where("state", isEqualTo: "CA");
    // citiesRef.where("name", isGreaterThanOrEqualTo: "San Francisco");
    // citiesRef.where("population", isLessThan: 1000000);
    // citiesRef.where("regions", arrayContains: "west_coast");
    // TODO: Consultas Compuestas
    // citiesRef.where("state", isEqualTo: "CA").where("name", isEqualTo: "Los Angeles");
    // citiesRef.where("state", isEqualTo: "CA").where("population", isLessThan: 1000000); // no funciona
    await query.getDocuments().then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) {
        print('${f.data}');
      });
    });
  }
  // La siguiente consulta muestra todas las capitales:

  void getCapitals() async {
    var capitalCities = databaseReference.collection("cities").where("capital", isEqualTo: true);
    await capitalCities.getDocuments().then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) {
        print('${f.data}');
      });
    });
  }
  

}
