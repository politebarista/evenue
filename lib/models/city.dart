import 'package:json_annotation/json_annotation.dart';

part 'city.g.dart';

@JsonSerializable()
class City {
  final String id;
  final String name;

  City(this.id, this.name);

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
}
