import 'package:evenue/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'organizer.g.dart';

@JsonSerializable()
class Organizer extends User {
  final String id;
  final String name;
  final String description;
  final double inn;
  final String contactPersonName;
  final String contactPersonPhone;
  final String contactPersonEmail;

  Organizer(
    this.id,
    this.name,
    this.description,
    this.inn,
    this.contactPersonName,
    this.contactPersonPhone,
    this.contactPersonEmail,
  );

  factory Organizer.fromJson(Map<String, dynamic> json) => _$OrganizerFromJson(
        json,
      );

  Map<String, dynamic> toJson() => _$OrganizerToJson(this);
}
