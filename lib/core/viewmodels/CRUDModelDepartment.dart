import 'dart:async';
import 'package:flutter/material.dart';
import '../../locator.dart';
import '../services/apiDepartment.dart';
import 'package:covid19/core/models/departmentModel/departmentModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CRUDModelDepartment extends ChangeNotifier {
  ApiDepartment _api = locator<ApiDepartment>();

  List<Department> department;


  Future<List<Department>> fetchProducts() async {
    var result = await _api.getDataCollection();
    department = result.documents
        .map((doc) => Department.fromMap(doc.data, doc.documentID))
        .toList();
    return department;
  }

  Stream<QuerySnapshot> fetchProductsAsStream() {
    return _api.streamDataCollection();
  }

  Future<Department> getProductById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  Department.fromMap(doc.data, doc.documentID) ;
  }


  Future removeProduct(String id) async{
     await _api.removeDocument(id) ;
     return ;
  }
  Future updateProduct(Department data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addProduct(Department data) async{
    var result  = await _api.addDocument(data.toJson()) ;

    return ;

  }

}