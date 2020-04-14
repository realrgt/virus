import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:vogu/models/categories-services.dart';

class Task extends ChangeNotifier {
  String id;
  String userId;
  String userName;
  String address;
  String latitude;
  String longitude;
  String time;
  String date;
  String specialistId;

  List<Service> _services = List();

  UnmodifiableListView<Service> get items => UnmodifiableListView(_services);

  void setServices(List<Service> service) {
    _services = service;
    notifyListeners();
  }

  Task({
    this.id,
    this.userId,
    this.userName,
    this.address,
    this.latitude,
    this.longitude,
    this.time,
    this.date,
    this.specialistId,
  });

  Task.fromMap(Map snapshot, String id)
      : id = id,
        userId = snapshot['userId'],
        userName = snapshot['userName'],
        address = snapshot['address'],
        latitude = snapshot['latitude'],
        longitude = snapshot['longitude'],
        time = snapshot['time'],
        date = snapshot['date'],
        specialistId = snapshot['specialistId'];

  toJson() {
    return {
      "userId": userId,
      "userName": userName,
      "address": address,
      "latitude": latitude,
      "longitude": longitude,
      "time": time,
      "date": date,
      "specialistId": specialistId,
    };
  }
}
