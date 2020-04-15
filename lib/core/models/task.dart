import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:vogu/models/categories-services.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

@JsonSerializable(explicitToJson: true)
class Task extends ChangeNotifier {
  String id;
  String userId;
  String userName;
  String address;
  double latitude;
  double longitude;
  String time;
  String date;
  String specialistId;
  List<Service> services = List();

  UnmodifiableListView<Service> get items => UnmodifiableListView(services);

  void setServices(List<Service> service) {
    services = service;
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
    this.services,
  });

  factory Task.fromMap(Map<String, dynamic> snapshot, String id) => _$TaskFromJson(snapshot, id);

  Map<String, dynamic> toJson() => _$TaskToJson(this);


//  Task.fromMap(Map snapshot, String id)
//      : id = id,
//        userId = snapshot['userId'],
//        userName = snapshot['userName'],
//        address = snapshot['address'],
//        latitude = snapshot['latitude'],
//        longitude = snapshot['longitude'],
//        time = snapshot['time'],
//        date = snapshot['date'],
//        specialistId = snapshot['specialistId'];
//
//  toJson() {
//    return {
//      "userId": userId,
//      "userName": userName,
//      "address": address,
//      "latitude": latitude,
//      "longitude": longitude,
//      "time": time,
//      "date": date,
//      "specialistId": specialistId,
//    };
//  }
}
