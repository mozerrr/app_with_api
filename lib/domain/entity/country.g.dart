// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) {
  return Country(
    name: json['name'] as String? ?? '',
    subregion: json['subregion'] as String?,
    alpha2Code: json['alpha2Code'] as String?,
    flagUrl: json['flag'] as String?,
    latlng: (json['latlng'] as List<dynamic>)
        .map((e) => (e as num).toDouble())
        .toList(),
    numericCode: json['numericCode'] as String?,
    borders: json['borders'] as List<dynamic>,
    currencies: (json['currencies'] as List<dynamic>?)
            ?.map((e) => Currency.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    area: (json['area'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'name': instance.name,
      'subregion': instance.subregion,
      'alpha2Code': instance.alpha2Code,
      'flag': instance.flagUrl,
      'latlng': instance.latlng,
      'numericCode': instance.numericCode,
      'borders': instance.borders,
      'currencies': instance.currencies,
      'area': instance.area,
    };
