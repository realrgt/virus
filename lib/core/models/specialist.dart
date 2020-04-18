import 'package:vogu/core/models/service.dart';

class Specialist {
  String id;
  String name;
  String address;
  dynamic rating;
  String imgUrl;
  bool isAvailable;
  String email;
  String password;

  Specialist({
    this.id,
    this.name,
    this.address,
    this.rating,
    this.imgUrl,
    this.isAvailable,
    this.email,
    this.password,
  });

  Specialist.fromMap(Map snapshot, String id)
      : id = id,
        name = snapshot['name'],
        address = snapshot['address'],
        rating = snapshot['rating'],
        imgUrl = snapshot['imgUrl'],
        isAvailable = snapshot['isAvailable'],
        email = snapshot['email'],
        password = snapshot['password'];

  toJson() {
    return {
      "name": name,
      "address": address,
      "rating": rating,
      "imgUrl": imgUrl,
      "isAvailable": isAvailable,
      "email": email,
      "password": password,
    };
  }
}
