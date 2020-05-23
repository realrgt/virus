import 'package:vogu/models/categories-services.dart';

class Specialist {
  String id;
  String name;
  String address;
  dynamic rating;
  String imgUrl;
  bool isAvailable;
  String email;
  List<Service> services = List();

  Specialist({
    this.id,
    this.name,
    this.address,
    this.rating,
    this.imgUrl,
    this.isAvailable,
    this.email,
  });


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Specialist &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              name == other.name &&
              address == other.address &&
              rating == other.rating &&
              imgUrl == other.imgUrl &&
              isAvailable == other.isAvailable &&
              email == other.email &&
              services == other.services;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      address.hashCode ^
      rating.hashCode ^
      imgUrl.hashCode ^
      isAvailable.hashCode ^
      email.hashCode ^
      services.hashCode;

  @override
  String toString() {
  return 'id: $id name: $name, address: $address email: $email';
   }

  Specialist.fromMap(Map<String, dynamic> snapshot, String id)
      : id = id ?? '',
        name = snapshot['name'] ?? '',
        address = snapshot['address'] ?? '',
        rating = snapshot['rating'],
        imgUrl = snapshot['imgUrl'] ??
            'https://image.shutterstock.com/image-vector/default-avatar-profile-icon-grey-600w-518740741.jpg',
        isAvailable = snapshot['isAvailable'],
        email = snapshot['email'] ?? '',
        services = (snapshot['services'] as List)
            ?.map((e) => e == null ? null : Service.fromJson(e as Map<String, dynamic>))
            ?.toList();

  toJson() {
    return {
      "name": name,
      "address": address,
      "rating": rating,
      "imgUrl": imgUrl,
      "isAvailable": isAvailable,
      "email": email,
      'services': services?.map((e) => e?.toJson())?.toList(),
    };
  }
}
