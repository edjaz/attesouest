// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(
    json['line1'] as String,
    json['line2'] as String,
    json['zip'] as String,
    json['city'] as String,
  );
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'line1': instance.line1,
      'line2': instance.line2,
      'zip': instance.zip,
      'city': instance.city,
    };

Point _$PointFromJson(Map<String, dynamic> json) {
  return Point(
    (json['x'] as num)?.toDouble(),
    (json['y'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$PointToJson(Point instance) => <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
    };

AppSettings _$AppSettingsFromJson(Map<String, dynamic> json) {
  return AppSettings(
    _$enumDecodeNullable(_$CivilityEnumMap, json['civility']),
    json['lastname'] as String,
    json['firstname'] as String,
    json['birthday'] == null
        ? null
        : DateTime.parse(json['birthday'] as String),
    json['address'] == null
        ? null
        : Address.fromJson(json['address'] as Map<String, dynamic>),
    (json['options'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(_$enumDecodeNullable(_$MoveEnumMap, k), e as bool),
    ),
    (json['sign'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          int.parse(k),
          (e as List)
              ?.map((e) =>
                  e == null ? null : Point.fromJson(e as Map<String, dynamic>))
              ?.toList()),
    ),
    json['doInCity'] as String,
    json['birthdayPlace'] as String,
    json['started'] == null ? null : DateTime.parse(json['started'] as String),
  );
}

Map<String, dynamic> _$AppSettingsToJson(AppSettings instance) =>
    <String, dynamic>{
      'civility': _$CivilityEnumMap[instance.civility],
      'lastname': instance.lastname,
      'firstname': instance.firstname,
      'birthdayPlace': instance.birthdayPlace,
      'birthday': instance.birthday?.toIso8601String(),
      'address': instance.address,
      'options': instance.options?.map((k, e) => MapEntry(_$MoveEnumMap[k], e)),
      'sign': instance.sign?.map((k, e) => MapEntry(k.toString(), e)),
      'doInCity': instance.doInCity,
      'started': instance.started?.toIso8601String(),
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$CivilityEnumMap = {
  Civility.Mr: 'Mr',
  Civility.Mme: 'Mme',
};

const _$MoveEnumMap = {
  Move.Pro: 'Pro',
  Move.Buy: 'Buy',
  Move.Health: 'Health',
  Move.Family: 'Family',
  Move.Activity: 'Activity',
  Move.Judiciaire: 'Judiciaire',
  Move.InteretGeneral: 'InteretGeneral',
};
