import 'dart:async';
import 'package:flutter/material.dart';
import 'package:vogu/core/models/client.dart';
import '../../locator.dart';
import '../services/api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ClientCRUD extends ChangeNotifier {
  Api _api = locator<Api>();

  String path = 'clients';
  List<Client> specialists;



  Future<List<Client>> fetchClients() async {
    var result = await _api.getDataCollection(this.path);
    specialists = result.documents
        .map((doc) => Client.fromMap(doc.data, doc.documentID))
        .toList();
    return specialists;
  }

  Stream<QuerySnapshot> fetchClientsAsStream() {
    return _api.streamDataCollection(this.path);
  }

  Future<Client> getClientById(String id) async {
    var doc = await _api.getDocumentById(this.path, id);
    return  Client.fromMap(doc.data, doc.documentID) ;
  }


  Future removeClient(String id) async{
    await _api.removeDocument(this.path, id) ;
    return ;
  }

  Future updateClient(Client data,String id) async{
    await _api.updateDocument(this.path, data.toJson(), id) ;
    return ;
  }

  Future addClient(Client data) async{
    var result  = await _api.addDocument(this.path, data.toJson()) ;

    return result;

  }


}