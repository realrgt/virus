import 'dart:async';
import 'package:flutter/material.dart';
import 'package:vogu/core/models/specialist.dart';
import 'package:vogu/models/categories-services.dart';
import '../../locator.dart';
import '../services/api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SpecialistCRUD extends ChangeNotifier {
  Api _api = locator<Api>();

  String path = 'specialist';
  List<Specialist> specialists;



  Future<List<Specialist>> fetchSpecialists() async {
    var result = await _api.getDataCollection(this.path);
    specialists = result.documents
        .map((doc) => Specialist.fromMap(doc.data, doc.documentID))
        .toList();
    return specialists;
  }

  Stream<QuerySnapshot> fetchSpecialistsAsStream() {
    return _api.streamDataCollection(this.path);
  }

  Future<Specialist> getSpecialistById(String id) async {
    var doc = await _api.getDocumentById(this.path, id);
    return  Specialist.fromMap(doc.data, doc.documentID) ;
  }


  Future removeSpecialist(String id) async{
    await _api.removeDocument(this.path, id) ;
    return ;
  }
  
  Future updateSpecialist(Specialist data,String id) async{
    await _api.updateDocument(this.path, data.toJson(), id) ;
    return ;
  }

  Future addSpecialist(Specialist data) async{
    var result  = await _api.addDocument(this.path, data.toJson()) ;

    return result;

  }

    // updates the list of services
  Future setServices(List<Service> data , String id) async {

    List<Map> list = new List();

    if(data !=null && data.isNotEmpty){
      data.forEach((s){
        list.add(s.toJson());
      });
    }

    return await Firestore.instance.collection(path).document(id).setData({"services": FieldValue.arrayUnion(list)}) ;
  }


}