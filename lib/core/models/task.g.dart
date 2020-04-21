// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json, String id) {
  return Task(
    id: id,
    userId: json['userId'] as String,
    userName: json['userName'] as String,
    imgUrl: json['imgUrl'] as String,
    address: json['address'] as String,
    latitude: (json['latitude'] as num)?.toDouble(),
    longitude: (json['longitude'] as num)?.toDouble(),
    time: json['time'] as String,
    date: json['date'] as String,
    specialistId: json['specialistId'] as String,
    services: (json['services'] as List)
        ?.map((e) =>
            e == null ? null : Service.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'imgUrl': instance.imgUrl,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'time': instance.time,
      'date': instance.date,
      'specialistId': instance.specialistId,
      'services': instance.services?.map((e) => e?.toJson())?.toList(),
    };
