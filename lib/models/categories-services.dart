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
  String name;
  double price;
  String category;

  Service({this.name, this.price, this.category});

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);
  Map<String, dynamic> toJson() => _$ServiceToJson(this);

  @override
  String toString() {
    return 'category: $category, name: $name, price: $price';
  }
}

var categories = <Category>[
  Category(id: 0, categoryName: 'Unhas', imgUrl: NEILS, services: <Service>[
    Service(name: 'Manicure', price: 100.0, category: 'Unhas'),
    Service(name: 'Pedicure', price: 100.0, category: 'Unhas'),
    Service(name: 'Colocar acrílicas', price: 100.0, category: 'Unhas'),
    Service(name: 'Overlay', price: 100.0, category: 'Unhas'),
    Service(name: 'Gelish', price: 100.0, category: 'Unhas'),
    Service(name: 'Manutenção acrílicas', price: 100.0, category: 'Unhas'),
    Service(name: 'Manutenção overlay', price: 100.0, category: 'Unhas'),
  ]),
  Category(id: 1, categoryName: 'Rosto', imgUrl: FACE, services: <Service>[
    Service(name: 'Limpeza facial', price: 100.0, category: 'Rosto'),
    Service(name: 'Design sombracelhas', price: 100.0, category: 'Rosto'),
    Service(name: 'Pintura sombracelhas', price: 100.0, category: 'Rosto'),
    Service(name: 'Tatuagem sombracelhas', price: 100.0, category: 'Rosto'),
    Service(name: 'Colocar pestanas 1 a 1', price: 100.0, category: 'Rosto'),
    Service(name: 'Colocar pestanas em saia', price: 100.0, category: 'Rosto'),
    Service(name: 'Colocar pestanas 4 a 4', price: 100.0, category: 'Rosto'),
    Service(name: 'Busso da barba', price: 100.0, category: 'Rosto'),
    Service(name: 'Busso do bigode', price: 100.0, category: 'Rosto'),
  ]),
  Category(id: 2, categoryName: 'Makeup', imgUrl: MAKEUP, services: <Service>[
    Service(name: 'Simples', price: 100.0, category: 'Makeup'),
    Service(name: 'Para casamento', price: 100.0, category: 'Makeup'),
    Service(name: 'Causal', price: 100.0, category: 'Makeup'),
    Service(name: 'Para espectáculos', price: 100.0, category: 'Makeup'),
    Service(name: 'artística', price: 100.0, category: 'Makeup'),
    Service(name: 'Para noivados', price: 100.0, category: 'Makeup'),
    Service(name: 'Para apresentação', price: 100.0, category: 'Makeup'),
    Service(name: 'Profissional', price: 100.0, category: 'Makeup'),
  ]),
  Category(
      id: 3,
      categoryName: 'Massagem',
      imgUrl: MASSAGE,
      services: <Service>[
        Service(name: 'Shiatsu', price: 100.0, category: 'Massagem'),
        Service(name: 'Drenagem', price: 100.0, category: 'Massagem'),
        Service(name: 'Linfática', price: 100.0, category: 'Massagem'),
        Service(name: 'Pedras quentes', price: 100.0, category: 'Massagem'),
        Service(name: 'Esportiva', price: 100.0, category: 'Massagem'),
        Service(name: 'Pré-natal', price: 100.0, category: 'Massagem'),
      ]),
  Category(
      id: 4,
      categoryName: 'Depilação',
      imgUrl: HAIR_REMOVAL,
      services: <Service>[
        Service(name: 'Axila', price: 100.0, category: 'Depilação'),
        Service(name: 'Verilha', price: 100.0, category: 'Depilação'),
        Service(name: 'Corpo todo', price: 100.0, category: 'Depilação'),
        Service(name: 'Pernas', price: 100.0, category: 'Depilação'),
        Service(name: 'Púbica', price: 100.0, category: 'Depilação'),
        Service(name: 'Rosto', price: 100.0, category: 'Depilação'),
      ]),
  Category(id: 5, categoryName: 'Cabelos', imgUrl: HAIR, services: <Service>[
    Service(name: 'Tranças', price: 100.0, category: 'Cabelos'),
    Service(name: 'Próteses', price: 100.0, category: 'Cabelos'),
    Service(name: 'Tissagem', price: 100.0, category: 'Cabelos'),
    Service(name: 'Extensões', price: 100.0, category: 'Cabelos'),
    Service(name: 'Tratamento cabelo', price: 100.0, category: 'Cabelos'),
    Service(name: 'Penteados casamentos', price: 100.0, category: 'Cabelos'),
    Service(name: 'Penteados noivados', price: 100.0, category: 'Cabelos'),
    Service(name: 'Penteados apresentações', price: 100.0, category: 'Cabelos'),
  ]),
];
