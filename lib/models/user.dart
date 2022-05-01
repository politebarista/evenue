import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'Id')
  final String id;
  @JsonKey(name: 'LastName')
  final String lastName;
  @JsonKey(name: 'FirstName')
  final String firstName;
  @JsonKey(name: 'Email')
  final String email;
  @JsonKey(name: 'PhoneNumber')
  final String phoneNumber;

  User(
    this.id,
    this.lastName,
    this.firstName,
    this.email,
    this.phoneNumber,
  );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(
        json,
      );

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
