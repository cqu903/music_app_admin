// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MusicCreateRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MusicCreateRequest _$MusicCreateRequestFromJson(Map<String, dynamic> json) =>
    MusicCreateRequest(
      name: json['name'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$MusicCreateRequestToJson(MusicCreateRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
    };
