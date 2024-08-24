import 'package:json_annotation/json_annotation.dart';

part 'model_weather.g.dart';

@JsonSerializable()
class ModelWeather {
  ModelWeather(this.id, this.main, this.description);

  int id;
  String main;
  String description;

  factory ModelWeather.fromJson(Map<String, dynamic> json) =>
      _$ModelWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$ModelWeatherToJson(this);
}
