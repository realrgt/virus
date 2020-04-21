
import 'package:flutter/material.dart';

class Servico with ChangeNotifier {
  String id;
  String name;
  double price;
  String category;
  String specialistId;

  Servico({this.id, this.name, this.price, this.category, this.specialistId});

  Servico.fromMap(Map snapshot, String id)
      : id = id,
        name = snapshot['name'],
        price = snapshot['price'],
        category = snapshot['category'],
        specialistId = snapshot['specialistId'];

  toJson() {
    return {
      "name": name,
      "price": price,
      "category": category,
      "specialistId": specialistId,
    };
  }

}
