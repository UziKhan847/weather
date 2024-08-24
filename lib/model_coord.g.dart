// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_coord.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelCoord _$ModelCoordFromJson(Map<String, dynamic> json) => ModelCoord(
      (json['lon'] as num).toDouble(),
      (json['lat'] as num).toDouble(),
    );

Map<String, dynamic> _$ModelCoordToJson(ModelCoord instance) =>
    <String, dynamic>{
      'lon': instance.lon,
      'lat': instance.lat,
    };
