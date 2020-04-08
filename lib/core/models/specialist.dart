import 'package:vogu/core/models/service.dart';

class Specialist {
  String id;
  String name;
  String email;
  String phone;
  String password;
  String address;
  String rating;
  String imgUrl;
  List<Service> services;
  String docUrl;
  bool isAvailable;

  Specialist(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.password,
      this.address,
      this.rating,
      this.imgUrl,
      this.services,
      this.docUrl,
      this.isAvailable});

  Specialist.fromMap(Map snapshot, String id)
      : id = id,
        name = snapshot['name'],
        email = snapshot['email'],
        phone = snapshot['phone'],
        password = snapshot['password'],
        address = snapshot['address'],
        rating = snapshot['rating'],
        imgUrl = snapshot['imgUrl'],
        services = snapshot['services'],
        docUrl = snapshot['docUrl'],
        isAvailable = snapshot['isAvailable'];

  toJson() {
    return {
      "name": name,
      "email": email,
      "phone": phone,
      "password": password,
      "address": address,
      "rating": rating,
      "imgUrl": imgUrl,
      "services": services,
      "docUrl": docUrl,
      "isAvailable": isAvailable,
    };
  }
}
