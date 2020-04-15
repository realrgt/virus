import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vogu/util/img_assets.dart';

part 'categories-services.g.dart';

class Category {
  int id;
  String categoryName;
  String imgUrl;
  List<Service> services;

  Category({this.id, this.categoryName, this.imgUrl, this.services});

  @override
  String toString() {
    return 'Category{id: $id, categoryName: $categoryName, imgUrl: $imgUrl, services: $services}';
  }
}

@JsonSerializable()
class Service with ChangeNotifier {
  int serviceId;
  String name;
  double price;

  Service({this.serviceId, this.name, this.price});

  factory Service.fromJson(Map<String, dynamic> json) => _$ServiceFromJson(json);
  Map<String, dynamic> toJson() => _$ServiceToJson(this);

  @override
  String toString() {
    return 'Service{serviceId: $serviceId, name: $name, price: $price}';
  }
}

var categories = <Category>[
  Category(id: 0, categoryName: 'Unhas', imgUrl: NEILS, services: <Service>[
    Service(serviceId: 1, name: 'Manicure', price: 100.0),
    Service(serviceId: 2, name: 'Pedicure', price: 100.0),
    Service(serviceId: 3, name: 'Colocar acrílicas', price: 100.0),
    Service(serviceId: 4, name: 'Overlay', price: 100.0),
    Service(serviceId: 5, name: 'Gelish', price: 100.0),
    Service(serviceId: 6, name: 'Manutenção acrílicas', price: 100.0),
    Service(serviceId: 7, name: 'Manutenção overlay', price: 100.0),
  ]),
  Category(id: 1, categoryName: 'Rosto', imgUrl: FACE, services: <Service>[
    Service(serviceId: 1, name: 'Limpeza facial', price: 100.0),
    Service(serviceId: 2, name: 'Design sombracelhas', price: 100.0),
    Service(serviceId: 3, name: 'Pintura sombracelhas', price: 100.0),
    Service(serviceId: 4, name: 'Tatuagem sombracelhas', price: 100.0),
    Service(serviceId: 5, name: 'Colocar pestanas 1 a 1', price: 100.0),
    Service(serviceId: 6, name: 'Colocar pestanas em saia', price: 100.0),
    Service(serviceId: 7, name: 'Colocar pestanas 4 a 4', price: 100.0),
    Service(serviceId: 8, name: 'Busso da barba', price: 100.0),
    Service(serviceId: 9, name: 'Busso do bigode', price: 100.0),
  ]),
  Category(id: 2, categoryName: 'MakeUp', imgUrl: MAKEUP, services: <Service>[
    Service(serviceId: 1, name: 'Simples', price: 100.0),
    Service(serviceId: 2, name: 'Para casamento', price: 100.0),
    Service(serviceId: 3, name: 'Causal', price: 100.0),
    Service(serviceId: 4, name: 'Para espectáculos', price: 100.0),
    Service(serviceId: 5, name: 'artística', price: 100.0),
    Service(serviceId: 6, name: 'Para noivados', price: 100.0),
    Service(serviceId: 7, name: 'Para apresentação', price: 100.0),
    Service(serviceId: 8, name: 'Profissional', price: 100.0),
  ]),
  Category(
      id: 3,
      categoryName: 'Massagem',
      imgUrl: MASSAGE,
      services: <Service>[
        Service(serviceId: 1, name: 'Shiatsu', price: 100.0),
        Service(serviceId: 2, name: 'Drenagem', price: 100.0),
        Service(serviceId: 3, name: 'Linfática', price: 100.0),
        Service(serviceId: 4, name: 'Pedras quentes', price: 100.0),
        Service(serviceId: 5, name: 'Esportiva', price: 100.0),
        Service(serviceId: 6, name: 'Pré-natal', price: 100.0),
      ]),
  Category(
      id: 4,
      categoryName: 'Depilação',
      imgUrl: HAIR_REMOVAL,
      services: <Service>[
        Service(serviceId: 1, name: 'Axila', price: 100.0),
        Service(serviceId: 2, name: 'Verilha', price: 100.0),
        Service(serviceId: 3, name: 'Corpo todo', price: 100.0),
        Service(serviceId: 4, name: 'Pernas', price: 100.0),
        Service(serviceId: 5, name: 'Púbica', price: 100.0),
        Service(serviceId: 6, name: 'Rosto', price: 100.0),
      ]),
  Category(id: 5, categoryName: 'Cabelos', imgUrl: HAIR, services: <Service>[
    Service(serviceId: 6, name: 'Tranças', price: 100.0),
    Service(serviceId: 6, name: 'Próteses', price: 100.0),
    Service(serviceId: 6, name: 'Tissagem', price: 100.0),
    Service(serviceId: 6, name: 'Extensões', price: 100.0),
    Service(serviceId: 6, name: 'Tratamento cabelo', price: 100.0),
    Service(serviceId: 6, name: 'Penteados casamentos', price: 100.0),
    Service(serviceId: 6, name: 'Penteados noivados', price: 100.0),
    Service(serviceId: 6, name: 'Penteados apresentações', price: 100.0),
  ]),
];
