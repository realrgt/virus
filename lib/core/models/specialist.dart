import 'package:vogu/core/models/service.dart';

class Specialist {
  String id;
  String name;
  String address;
  dynamic rating;
  String imgUrl;
  bool isAvailable;

  Specialist({
    this.id,
    this.name,
    this.address,
    this.rating,
    this.imgUrl,
    this.isAvailable,
  });

  Specialist.fromMap(Map snapshot, String id)
      : id = id,
        name = snapshot['name'],
        address = snapshot['address'],
        rating = snapshot['rating'],
        imgUrl = snapshot['imgUrl'],
        isAvailable = snapshot['isAvailable'];

  toJson() {
    return {
      "name": name,
      "address": address,
      "rating": rating,
      "imgUrl": imgUrl,
      "isAvailable": isAvailable,
    };
  }
}
