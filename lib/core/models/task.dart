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
  String imgUrl;
  String address;
  double latitude;
  double longitude;
  String time;
  String date;
  String specialistId;
  List<Service> services = List();

//  UnmodifiableListView<Service> get items => UnmodifiableListView(services);

  List<Service> get items => services;

  void setServices(List<Service> service) {
    services = service;
    notifyListeners();
  }

  Task({
    this.id,
    this.userId,
    this.userName,
    this.imgUrl,
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

}
