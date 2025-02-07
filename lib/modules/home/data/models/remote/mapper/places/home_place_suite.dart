import 'package:json_annotation/json_annotation.dart';

import 'home_place_suite_category_item.dart';
import 'home_place_suite_item.dart';
import 'home_place_suite_period.dart';

part 'home_place_suite.g.dart';

@JsonSerializable()
class HomePlaceSuite {
  HomePlaceSuite({
    required this.name,
    required this.quantity,
    required this.showQuantityAvailable,
    required this.photos,
    required this.items,
    required this.itemsCategory,
    required this.periods,
  });

  @JsonKey(name: 'nome')
  final String name;

  @JsonKey(name: 'qtd')
  final int quantity;

  @JsonKey(name: 'exibirQtdDisponiveis')
  final bool showQuantityAvailable;

  @JsonKey(name: 'fotos')
  final List<String> photos;

  @JsonKey(name: 'itens')
  final List<HomePlaceSuiteItem> items;

  @JsonKey(name: 'categoriaItens')
  final List<HomePlaceSuiteCategoryItem> itemsCategory;

  @JsonKey(name: 'periodos')
  final List<HomePlaceSuitePeriod> periods;

  factory HomePlaceSuite.fromJson(Map<String, dynamic> json) =>
      _$HomePlaceSuiteFromJson(json);

  Map<String, dynamic> fromJson() => _$HomePlaceSuiteToJson(this);
}
