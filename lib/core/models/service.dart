
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vogu/models/categories-services.dart';

part 'service.g.dart';

@JsonSerializable(explicitToJson: true)
class Servico with ChangeNotifier {
  String id;
  List<Service> services = List();

  Servico({this.id, this.services});

  factory Servico.fromMap(Map<String, dynamic> json, String id) => _$ServicoFromJson(json, id);
  Map<String, dynamic> toJson() => _$ServicoToJson(this);

}
