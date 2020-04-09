import 'dart:async';
import 'package:flutter/material.dart';
import 'package:vogu/core/models/specialist.dart';
import '../../locator.dart';
import '../services/api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SpecialistCRUD extends ChangeNotifier {
  Api _api = locator<Api>();

  List<Specialist> specialists;


  Future<List<Specialist>> fetchSpecialists() async {
    var result = await _api.getDataCollection();
    specialists = result.documents
        .map((doc) => Specialist.fromMap(doc.data, doc.documentID))
        .toList();
    return specialists;
  }

  Stream<QuerySnapshot> fetchSpecialistsAsStream() {
    return _api.streamDataCollection();
  }

  Future<Specialist> getSpecialistById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  Specialist.fromMap(doc.data, doc.documentID) ;
  }


  Future removeSpecialist(String id) async{
    await _api.removeDocument(id) ;
    return ;
  }
  Future updateSpecialist(Specialist data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addSpecialist(Specialist data) async{
    var result  = await _api.addDocument(data.toJson()) ;

    return ;

  }


}