import 'package:json_annotation/json_annotation.dart';

part 'settings.g.dart';

enum Move { Pro, Buy, Health, Family, Activity, Judiciaire, InteretGeneral }
enum Civility { Mr, Mme }

@JsonSerializable()
class Address {
  String line1 = '';
  String line2 = '';
  String zip = '';
  String city = '';

  Address(this.line1, this.line2, this.zip, this.city);

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);

  @override
  String toString() {
    return '$line1 $line2 $zip $city';
  }
}

@JsonSerializable()
class Point {
  double x;
  double y;

  Point(this.x, this.y);

  factory Point.fromJson(Map<String, dynamic> json) => _$PointFromJson(json);

  Map<String, dynamic> toJson() => _$PointToJson(this);
}

@JsonSerializable()
class AppSettings {
  Civility civility;
  String lastname;
  String firstname;
  String birthdayPlace;
  DateTime birthday;
  Address address;
  Map<Move, bool> options;
  Map<int, List<Point>> sign;
  String doInCity;
  DateTime started;


  factory AppSettings.defaultObj() {
    return AppSettings(
        Civility.Mr,
        '',
        '',
        DateTime(1980),
        Address('', '', '', ''),
        {
          Move.Activity: false,
          Move.Family: false,
          Move.Health: false,
          Move.Pro: false,
          Move.Buy: false,
          Move.Judiciaire: false,
          Move.InteretGeneral: false
        },
        {},
        '',
        '',
        DateTime.now());
  }


  AppSettings(this.civility,
      this.lastname,
      this.firstname,
      this.birthday,
      this.address,
      this.options,
      this.sign,
      this.doInCity,
      this.birthdayPlace,
      this.started);

  factory AppSettings.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$AppSettingsToJson(this);
}
