import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:covid19/core/models/product.model.dart';
import 'package:covid19/core/viewmodels/CRUDModel.dart';
import 'package:covid19/ui/widgets/productCard.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Product> products;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CRUDModel>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addProduct');
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: getTotalPrice(productProvider),
      ),
      body: Container(
        child: StreamBuilder(
          stream: productProvider.fetchProductsAsStream(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              products = snapshot.data.documents
                  .map((doc) => Product.fromMap(doc.data, doc.documentID))
                  .toList();
              // print(products[0].price);
              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (buildContext, index) =>
                    ProductCard(productDetails: products[index]),
              );
            } else {
              return Text('fetching');
            }
          },
        ),
      ),
    );
  }

  StreamBuilder<QuerySnapshot> getTotalPrice(CRUDModel productProvider) {
    return StreamBuilder(
      stream: productProvider.fetchProductsAsStream(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          products = snapshot.data.documents
              .map((doc) => Product.fromMap(doc.data, doc.documentID))
              .toList();
          // print(products[0].price);
          int a = 0;
          for (int i = 0; i<products.length ; i++){
            a  = a + int.parse(products[i].price);
            print(a);
          }
          // print(products.length);

          
          return Text(a.toString());
        } else {
          return Text('fetching');
        }
      },
    );
  }
}
