import 'package:json_annotation/json_annotation.dart';

part 'currency.g.dart';

@JsonSerializable()
class Currency {
  @JsonKey(name: 'code')
  final String? code;
  @JsonKey(name: 'name', defaultValue: '')
  final String name;
  @JsonKey(name: 'symbol')
  final String? symbol;

  Currency({
    this.name = '',
    this.code,
    this.symbol,
  });

  factory Currency.fromJson(Map<String, dynamic> json) =>
      _$CurrencyFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Currency &&
          runtimeType == other.runtimeType &&
          code == other.code &&
          name == other.name &&
          symbol == other.symbol;

  @override
  int get hashCode => code.hashCode ^ name.hashCode ^ symbol.hashCode;
}
