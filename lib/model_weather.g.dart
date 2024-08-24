// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelWeather _$ModelWeatherFromJson(Map<String, dynamic> json) => ModelWeather(
      (json['id'] as num).toInt(),
      json['main'] as String,
      json['description'] as String,
    );

Map<String, dynamic> _$ModelWeatherToJson(ModelWeather instance) =>
    <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
    };
