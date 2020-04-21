// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories-services.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Service _$ServiceFromJson(Map<String, dynamic> json) {
  return Service(
    name: json['name'] as String,
    price: (json['price'] as num)?.toDouble(),
    category: json['category'] as String,
  );
}

Map<String, dynamic> _$ServiceToJson(Service instance) => <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'category': instance.category,
    };
