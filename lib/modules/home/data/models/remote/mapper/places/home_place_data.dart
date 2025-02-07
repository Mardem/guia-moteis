import 'package:json_annotation/json_annotation.dart';

import 'home_place_motel.dart';

part 'home_place_data.g.dart';

@JsonSerializable()
class HomePlaceData {
  HomePlaceData({
    required this.page,
    required this.quantityPerPage,
    required this.totalSuites,
    required this.totalMoteis,
    required this.raio,
    required this.maxPage,
    required this.moteis,
  });

  @JsonKey(name: 'pagina')
  final int page;

  @JsonKey(name: 'qtdPorPagina')
  final int quantityPerPage;

  final int totalSuites;

  final int totalMoteis;
  final int raio;

  @JsonKey(name: 'maxPaginas')
  final int maxPage;

  final List<HomePlaceMotel> moteis;

  factory HomePlaceData.fromJson(Map<String, dynamic> json) =>
      _$HomePlaceDataFromJson(json);

  Map<String, dynamic> toJson() => _$HomePlaceDataToJson(this);
}
