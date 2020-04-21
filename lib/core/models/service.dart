
import 'package:flutter/material.dart';
import 'package:vogu/models/categories-services.dart';

class Servico with ChangeNotifier {
  String id;
  String specialistId;
  List<Service> services = List();

  Servico({this.id, this.specialistId, this.services});

  Servico.fromMap(Map snapshot, String id)
      : id = id,
        specialistId = snapshot['specialistId'] ?? '',
        services = (snapshot['services'] as List)?.map((s) => s == null ? null : Service.fromJson(s as Map<String, dynamic>));

  toJson() {
    return {
      "specialistId": specialistId,
      'services': services?.map((s) => s?.toJson())?.toList(),
    };
  }

}
