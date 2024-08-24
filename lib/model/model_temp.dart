import 'package:json_annotation/json_annotation.dart';

part 'model_temp.g.dart';

@JsonSerializable()
class ModelTemp {
  ModelTemp(
      this.temp, this.feels_like, this.temp_max, this.temp_min, this.humidity);

  double temp;
  double feels_like;
  double temp_min;
  double temp_max;
  double humidity;

  factory ModelTemp.fromJson(Map<String, dynamic> json) =>
      _$ModelTempFromJson(json);

  Map<String, dynamic> toJson() => _$ModelTempToJson(this);
}
