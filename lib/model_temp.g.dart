// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_temp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelTemp _$ModelTempFromJson(Map<String, dynamic> json) => ModelTemp(
      (json['temp'] as num).toDouble(),
      (json['feels_like'] as num).toDouble(),
      (json['temp_max'] as num).toDouble(),
      (json['temp_min'] as num).toDouble(),
      (json['humidity'] as num).toDouble(),
    );

Map<String, dynamic> _$ModelTempToJson(ModelTemp instance) => <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feels_like,
      'temp_min': instance.temp_min,
      'temp_max': instance.temp_max,
      'humidity': instance.humidity,
    };
