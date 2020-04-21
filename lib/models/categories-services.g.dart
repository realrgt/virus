// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories-services.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Service _$ServiceFromJson(Map<String, dynamic> json) {
  return Service(
    category: json['category'] as String,
    name: json['name'] as String,
    price: (json['price'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$ServiceToJson(Service instance) => <String, dynamic>{
      'category': instance.category,
      'name': instance.name,
      'price': instance.price,
    };
