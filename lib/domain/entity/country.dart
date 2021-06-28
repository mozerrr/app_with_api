import 'package:app_with_api/domain/entity/currency.dart';
import 'package:json_annotation/json_annotation.dart';

part 'country.g.dart';

@JsonSerializable()
class Country {
  @JsonKey(name: 'name', defaultValue: '')
  final String name;
  @JsonKey(name: 'subregion')
  final String? subregion;
  @JsonKey(name: 'alpha2Code')
  final String? alpha2Code;
  @JsonKey(name: 'flag')
  final String? flagUrl;
  @JsonKey(name: 'latlng')
  final List<double> latlng;
  @JsonKey(name: 'numericCode')
  final String? numericCode;
  @JsonKey(name: 'borders')
  final List<dynamic> borders;
  @JsonKey(name: 'currencies', defaultValue: [])
  final List<Currency> currencies;
  @JsonKey(name: 'area')
  final double? area;

  Country({
    this.name = '',
    this.subregion,
    this.alpha2Code,
    this.flagUrl,
    this.latlng = const [],
    this.numericCode,
    this.borders = const [],
    this.currencies = const [],
    this.area,
  });

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Country &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          subregion == other.subregion &&
          alpha2Code == other.alpha2Code &&
          flagUrl == other.flagUrl &&
          latlng == other.latlng &&
          numericCode == other.numericCode &&
          borders == other.borders &&
          currencies == other.currencies &&
          area == other.area;

  @override
  int get hashCode =>
      name.hashCode ^
      subregion.hashCode ^
      alpha2Code.hashCode ^
      flagUrl.hashCode ^
      latlng.hashCode ^
      numericCode.hashCode ^
      borders.hashCode ^
      currencies.hashCode ^
      area.hashCode;
}
