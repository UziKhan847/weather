import 'package:json_annotation/json_annotation.dart';

part 'model_coord.g.dart';

@JsonSerializable()
class ModelCoord {
  ModelCoord(this.lon, this.lat);

  double lon;
  double lat;

  factory ModelCoord.fromJson(Map<String, dynamic> json) =>
      _$ModelCoordFromJson(json);

  Map<String, dynamic> toJson() => _$ModelCoordToJson(this);
}
