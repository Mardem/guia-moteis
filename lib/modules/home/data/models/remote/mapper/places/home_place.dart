import 'package:json_annotation/json_annotation.dart';

import 'home_place_data.dart';

part 'home_place.g.dart';

@JsonSerializable()
class HomePlace {
  HomePlace({
    required this.success,
    required this.data,
  });

  @JsonKey(name: 'sucesso')
  final bool success;

  final HomePlaceData data;

  factory HomePlace.fromJson(Map<String, dynamic> json) =>
      _$HomePlaceFromJson(json);

  Map<String, dynamic> toJson() => _$HomePlaceToJson(this);
}
