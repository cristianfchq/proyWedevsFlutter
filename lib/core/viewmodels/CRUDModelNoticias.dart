import 'dart:async';
import 'package:flutter/material.dart';
import '../../locator.dart';
import 'package:covid19/core/services/apiNoticias.dart';
import 'package:covid19/core/models/noticiasModel/noticiasModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CRUDModelNoticias extends ChangeNotifier {
  ApiNoticias _api = locator<ApiNoticias>();

  List<Noticias> department;


  Future<List<Noticias>> fetchProducts() async {
    var result = await _api.getDataCollection();
    department = result.documents
        .map((doc) => Noticias.fromMap(doc.data, doc.documentID))
        .toList();
    return department;
  }

  Stream<QuerySnapshot> fetchProductsAsStream() {
    return _api.streamDataCollection();
  }

  Future<Noticias> getProductById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  Noticias.fromMap(doc.data, doc.documentID) ;
  }


  Future removeProduct(String id) async{
     await _api.removeDocument(id) ;
     return ;
  }
  Future updateProduct(Noticias data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addProduct(Noticias data) async{
    var result  = await _api.addDocument(data.toJson()) ;

    return ;

  }

}