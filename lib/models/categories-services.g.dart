// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories-services.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Service _$ServiceFromJson(Map<String, dynamic> json) {
  return Service(
    serviceId: json['serviceId'] as int,
    name: json['name'] as String,
    price: (json['price'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$ServiceToJson(Service instance) => <String, dynamic>{
      'serviceId': instance.serviceId,
      'name': instance.name,
      'price': instance.price,
    };
