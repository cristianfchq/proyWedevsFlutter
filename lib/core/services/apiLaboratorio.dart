
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
class ApiLaboratorio{
  final Firestore _db = Firestore.instance;
  final String path;
  CollectionReference ref;

  ApiLaboratorio( this.path ) {
    ref = _db.collection(path);
  }

  Future<QuerySnapshot> getDataCollection() {
    return ref.getDocuments() ;
  }
  Stream<QuerySnapshot> streamDataCollection() {
    return ref.orderBy("numero", descending: false).snapshots() ;
  }
  Future<DocumentSnapshot> getDocumentById(String id) {
    return ref.document(id).get();
  }
  Future<void> removeDocument(String id){
    return ref.document(id).delete();
  }
  Future<DocumentReference> addDocument(Map data) {
    return ref.add(data);
  }
  Future<void> updateDocument(Map data , String id) {
    return ref.document(id).updateData(data) ;
  }

}