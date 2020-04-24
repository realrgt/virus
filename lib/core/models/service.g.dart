// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Servico _$ServicoFromJson(Map<String, dynamic> json, String id) {
  return Servico(
    id: id,
    services: (json['services'] as List)
        ?.map((e) =>
            e == null ? null : Service.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ServicoToJson(Servico instance) => <String, dynamic>{
      'services': instance.services?.map((e) => e?.toJson())?.toList(),
    };
