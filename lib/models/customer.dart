import 'package:json_annotation/json_annotation.dart';

part 'customer.g.dart';

@JsonSerializable()
class Customer {
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

  Customer(
    this.id,
    this.lastName,
    this.firstName,
    this.email,
    this.phoneNumber,
  );

  factory Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(
        json,
      );

  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}
