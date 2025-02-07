import 'package:json_annotation/json_annotation.dart';

part 'home_place_suite_period.g.dart';

@JsonSerializable()
class HomePlaceSuitePeriod {
  HomePlaceSuitePeriod({
    required this.formattedTime,
    required this.time,
    required this.price,
    required this.totalPrice,
    required this.hasCourtesy,
    this.discount,
  });

  @JsonKey(name: 'tempoFormatado')
  final String formattedTime;

  @JsonKey(name: 'tempo')
  final String time;

  @JsonKey(name: 'valor')
  final num price;

  @JsonKey(name: 'valorTotal')
  final num totalPrice;

  @JsonKey(name: 'temCortesia')
  final bool hasCourtesy;

  @JsonKey(name: 'desconto')
  final Discount? discount;

  factory HomePlaceSuitePeriod.fromJson(Map<String, dynamic> json) =>
      _$HomePlaceSuitePeriodFromJson(json);

  Map<String, dynamic> toJson() => _$HomePlaceSuitePeriodToJson(this);
}

@JsonSerializable()
class Discount {
  Discount({required this.discount});

  @JsonKey(name: 'desconto')
  final num discount;

  factory Discount.fromJson(Map<String, dynamic> json) =>
      _$DiscountFromJson(json);

  Map<String, dynamic> toJson() => _$DiscountToJson(this);
}
