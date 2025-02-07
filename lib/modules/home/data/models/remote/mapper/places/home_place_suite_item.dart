import 'package:json_annotation/json_annotation.dart';

part 'home_place_suite_item.g.dart';

@JsonSerializable()
class HomePlaceSuiteItem {
  HomePlaceSuiteItem({required this.name});

  @JsonKey(name: 'nome')
  final String name;

  factory HomePlaceSuiteItem.fromJson(Map<String, dynamic> json) =>
      _$HomePlaceSuiteItemFromJson(json);

  Map<String, dynamic> toJson() => _$HomePlaceSuiteItemToJson(this);
}
