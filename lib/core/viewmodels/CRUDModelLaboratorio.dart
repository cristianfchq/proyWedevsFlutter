import 'dart:async';
import 'package:flutter/material.dart';
import '../../locator.dart';
import 'package:covid19/core/services/apiLaboratorio.dart';
import 'package:covid19/core/models/laboratorio/laboratorioModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CRUDModelLaboratorio extends ChangeNotifier {
  ApiLaboratorio _api = locator<ApiLaboratorio>();

  List<Laboratorio> department;


  Future<List<Laboratorio>> fetchProducts() async {
    var result = await _api.getDataCollection();
    department = result.documents
        .map((doc) => Laboratorio.fromMap(doc.data, doc.documentID))
        .toList();
    return department;
  }

  Stream<QuerySnapshot> fetchProductsAsStream() {
    return _api.streamDataCollection();
  }

  Future<Laboratorio> getProductById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  Laboratorio.fromMap(doc.data, doc.documentID) ;
  }


  Future removeProduct(String id) async{
     await _api.removeDocument(id) ;
     return ;
  }
  Future updateProduct(Laboratorio data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addProduct(Laboratorio data) async{
    var result  = await _api.addDocument(data.toJson()) ;

    return ;

  }

}