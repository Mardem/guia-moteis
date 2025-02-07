import 'package:json_annotation/json_annotation.dart';

part 'home_place_suite_category_item.g.dart';

@JsonSerializable()
class HomePlaceSuiteCategoryItem {
  HomePlaceSuiteCategoryItem({required this.name, required this.icon});

  @JsonKey(name: 'nome')
  final String name;

  @JsonKey(name: 'icone')
  final String icon;

  factory HomePlaceSuiteCategoryItem.fromJson(Map<String, dynamic> json) =>
      _$HomePlaceSuiteCategoryItemFromJson(json);

  Map<String, dynamic> toJson() => _$HomePlaceSuiteCategoryItemToJson(this);
}
