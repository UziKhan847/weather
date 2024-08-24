// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Model _$ModelFromJson(Map<String, dynamic> json) => Model(
      ModelCoord.fromJson(json['coord'] as Map<String, dynamic>),
      (json['weather'] as List<dynamic>)
          .map((e) => ModelWeather.fromJson(e as Map<String, dynamic>))
          .toList(),
      ModelTemp.fromJson(json['main'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ModelToJson(Model instance) => <String, dynamic>{
      'coord': instance.coord,
      'weather': instance.weather,
      'main': instance.main,
    };
