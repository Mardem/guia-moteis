import 'package:json_annotation/json_annotation.dart';

import 'home_place_suite.dart';

part 'home_place_motel.g.dart';

@JsonSerializable()
class HomePlaceMotel {
  HomePlaceMotel({
    required this.name,
    required this.logo,
    required this.neighborhood,
    required this.distance,
    required this.quantityFavorites,
    required this.suites,
  });

  @JsonKey(name: 'fantasia')
  final String name;
  final String logo;

  @JsonKey(name: 'bairro')
  final String neighborhood;

  @JsonKey(name: 'distancia')
  final double distance;

  @JsonKey(name: 'qtdFavoritos')
  final int quantityFavorites;

  final List<HomePlaceSuite> suites;

  factory HomePlaceMotel.fromJson(Map<String, dynamic> json) =>
      _$HomePlaceMotelFromJson(json);

  Map<String, dynamic> toJson() => _$HomePlaceMotelToJson(this);
}
