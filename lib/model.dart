import 'package:json_annotation/json_annotation.dart';
import 'package:uzi_weather_app/model_coord.dart';
import 'package:uzi_weather_app/model_temp.dart';
import 'package:uzi_weather_app/model_weather.dart';

part 'model.g.dart';

@JsonSerializable()
class Model {
  Model(this.coord, this.weather, this.main);

  ModelCoord coord;
  List<ModelWeather> weather;
  ModelTemp main;

  factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);

  Map<String, dynamic> toJson() => _$ModelToJson(this);
}
