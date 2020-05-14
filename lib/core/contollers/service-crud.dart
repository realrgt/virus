import 'dart:async';
import 'package:flutter/material.dart';
import 'package:vogu/core/models/service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vogu/core/services/api.dart';
import 'package:vogu/locator.dart';
import 'package:vogu/models/categories-services.dart';

class ServiceCRUD extends ChangeNotifier {
  Api _api = locator<Api>();

  String path = 'services';
  List<Servico> services;

  Future<List<Servico>> fetchServices() async {
    var result = await _api.getDataCollection(this.path);
    services = result.documents
        .map((doc) => Servico.fromMap(doc.data, doc.documentID))
        .toList();
    return services;
  }

  Stream<QuerySnapshot> fetchServicesAsStream() {
    return _api.streamDataCollection(this.path);
  }

  Future<Servico> getServiceById(String id) async {
    var doc = await _api.getDocumentById(this.path, id);
    return  Servico.fromMap(doc.data, doc.documentID) ;
  }


  Future removeService(String id) async{
    await _api.removeDocument(this.path, id) ;
    return ;
  }

  Future updateService(Servico data,String id) async{
    await _api.updateDocument(this.path, data.toJson(), id) ;
    return ;
  }

  Future addService(Servico data) async{
    var result  = await _api.addDocument(this.path, data.toJson()) ;

    return result ;

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